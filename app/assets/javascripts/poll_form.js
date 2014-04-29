$(document).ready(function() {
  $(":checkbox").on("change", function() {
    if(this.checked && !this.multiple) {
      var checkname = $(this).attr("name");
      $(":checkbox[name='" + checkname + "']").not(this).removeAttr("checked");
      this.checked = true

    }
  })
})
