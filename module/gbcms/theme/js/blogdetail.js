document.getElementById("thumbnail-" + check_style).style.display = "block";

if(check_style == 3){
    document.getElementById("blog-content").classList.remove("col-12");
    document.getElementById("blog-content").classList.add("col-lg-8");
    document.getElementById("blog-related-post").style.display = "block";
  } else
  {
    document.getElementById("blog-content").classList.remove("col-8");
    document.getElementById("blog-content").classList.add("col-lg-12");
    document.getElementById("blog-related-post").style.display = "none";
}

// $(function () {
//   $('[data-toggle="tooltip"]').tooltip()
// })