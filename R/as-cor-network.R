#' Coerce to a cor_network object
#' @description Functions to coerce a object to cor_network if possible.
#' @param x any \code{R} object.
#' @param simplify logical value (defaults to TRUE) indicating whether to
#'     delete nodes without edge connections.
#' @param r.thres a numeric value.
#' @param r.absolute logical value (defaults to TRUE).
#' @param p.thres a numeric value.
#' @param ... extra params passing to \code{\link[ggcor]{cor_network}}.
#' @return a cor_network object.
#' @rdname as_cor_network
#' @examples
#' ll <- correlate(mtcars)
#' as_cor_network(ll)
#' @author Houyun Huang, Lei Zhou, Jian Chen, Taiyun Wei
#' @export
as_cor_network <- function(x, ...) {
  UseMethod("as_cor_network")
}

#' @rdname  as_cor_network
#' @export
#' @method as_cor_network cor_tbl
as_cor_network.cor_tbl <- function(x,
                                   simplify = TRUE,
                                   r.thres = 0.6,
                                   r.absolute = TRUE,
                                   p.thres = 0.05,
                                   ...)
{
  if("p.value" %in% names(x)) {
    edges <- if(r.absolute) {
      dplyr::filter(x, abs(r) > r.thres, p.value < p.thres)
    } else {
      dplyr::filter(x, r > r.thres, p.value < p.thres)
    }
  } else {
    edges <- if(r.absolute) {
      dplyr::filter(x, abs(r) > r.thres)
    } else {
      dplyr::filter(x, r > r.thres, p.value < p.thres)
    }
  }
  nodes <- if(simplify) {
    tibble::tibble(name = unique(c(x$.col.names, x$.row.names)))
  } else {
    tibble::tibble(name = unique(c(get_col_name(x), get_row_name(x))))
  }
  structure(.Data = list(nodes = nodes, 
                         edges  = edges), class = "cor_network")
}

#' @rdname  as_cor_network
#' @export
#' @method as_cor_network mantel_tbl
as_cor_network.mantel_tbl <- function(x, ...) {
  as_cor_network(as_cor_tbl(x), ...)
}

#' @rdname  as_cor_network
#' @export
#' @method as_cor_network matrix
as_cor_network.matrix <- function(x, ...) {
  cor_network(corr = x, ..., val.type = "list")
}
#' @rdname  as_cor_network
#' @export
#' @method as_cor_network data.frame
as_cor_network.data.frame <- function(x, ...) {
  cor_network(corr = x, ..., val.type = "list")
}

#' @rdname  as_cor_network
#' @export
#' @method as_cor_network correlation
as_cor_network.correlation <- function(x, ...) {
  cor_network(corr = x$r, p.value = x$p.value, ..., val.type = "list")
}

#' @rdname  as_cor_network
#' @export
#' @method as_cor_network rcorr
as_cor_network.rcorr <- function(x, ...)
{
  p.value <- x$P
  diag(p.value) <- 0
  cor_network(corr = x$r, p.value = p.value, ..., val.type = "list")
}

#' @rdname  as_cor_network
#' @export
#' @method as_cor_network corr.test
as_cor_network.corr.test <- function(x, ...)
{
  cor_network(corr = x$r, p.value = x$p, ..., val.type = "list")
}

#' @rdname as_cor_network
#' @export
#' @method as_cor_network default
as_cor_network.default <- function(x, ...) {
  stop(class(x)[1], " hasn't been realized yet.", call. = FALSE)
}