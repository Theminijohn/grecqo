// Always clean the bootstrap modal cached content
$(document).on("hidden.bs.modal", function (e) {
  $(e.target).removeData("bs.modal").find(".modal-content").empty();
});