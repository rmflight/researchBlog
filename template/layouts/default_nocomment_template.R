
(function(page){
  useTitle <- paste0(page$title, " -- Deciphering life: One bit at a time")
  
    links <- list(c("/index.html", "Home"),
                  c("/pages/about.html", "About"),
                  c("/pages/archive.html", "Blog Archive"),
                  c("https://github.com/rmflight/researchBlog", "Blog Source"),
                  c("https://github.com/rmflight?tab=repositories", "Github Repos"),
                  c("http://www.ncbi.nlm.nih.gov/myncbi/robert%20m.flight.1/comments/", "PubmedCommons Comments"),
                  c("/pages/cv.html", "CV"))
  
    twitter <- include.textfile(file.path(site, "template", "resources", "html", "twitter.html"))
  
    feeds <- unordered.list(list(
      c(link.to("/rss.xml", "SiteWide Feed")),
      c(link.to("/tags/R.xml", "R Feed"))), list.opts = list(class="feed-list"))
  
    blogroll <- list(c("http://www.r-bloggers.com/", "R bloggers"),
                     c("http://ivory.idyll.org/blog/", "Living in an Ivory Basement"),
                     c("http://bytesizebio.net/", "Byte Size Biology"),
                     c("http://robjhyndman.com/hyndsight/", "Hyndsight"),
                     c("http://solomonmessing.wordpress.com/blog/", "Solomon Messing"),
                     c("http://nsaunders.wordpress.com/", "What You're Doing Is Rather Desperate"),
                     c("http://yihui.name/en/", "Yihui Xie's Blog"),
                     c("http://simplystatistics.org/", "Simply Statistics"),
                     c("http://software-carpentry.org/",
                       "Software carpentry"))
  
    webdoc("html5",
           html_head(useTitle,
                     '<meta charset="utf-8"><meta content="width=device-width, initiali-scale=1.0, user-scalable=yes" name="viewport">',
                     '<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">',
                     '<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">',
                     '<link href="/css/smartphone.css" media="only screen and (max-device-width:480px)" rel="stylesheet" type="text/css">',
                     '<link href="/css/feedList.css" rel="stylesheet" type="text/css">',
                     include.textfile(file.path(site, "template", "resources", "html", "analytics.html")),
                     include.textfile(file.path(site, "template", "resources", "html", "social_sharing.html")),
                     include.textfile(file.path(site, "template", "resources", "html", "r_highlight.html"))),
           html_body(
               m("div.container-fluid well",
                 m("h1", "Deciphering life: One bit at a time"),
                 m("p", "Robert M Flight's home on the web")),
               m("div.subnav",
                 unordered.list(lapply(links, function(x) link.to(x[1], x[2])),
                                list.opts = list(class="nav nav-pills"))),
               m("div.container-fluid",
                 m("div.row-fluid",
                   m("div.span1"),
                   m("div.span9", page$content),
                   m("div.span2",
                     twitter,
                     m("h3", "Feeds"),
                     feeds,
                     m("h3", "Blog Roll"),
                     unordered.list(lapply(blogroll, function(x) link.to(x[1], x[2]))),
                     m("h3", "Tags"),
                     html.taglist(site)
                     
                     )),
                 m("div.span12",
                   m("div.span2"),
                   m("div.span8",
                     m("footer.footer",
                       m("p.right back_to_top",
                         link.to("#", "&uArr; Page Top")),
                       m("p", link.to("https://github.com/DASpringate/samatha", "Built in R with Samatha"))))))))
})(page)