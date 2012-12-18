$(function () {
    bind_cmp_events();

    function bind_cmp_events() {
        bind_search_event();
    }

    function bind_search_event() {
        $("#searchText").focus(function() {
            $(this).css("color", "black");
            $(this).data("data-pholder", $(this).attr("placeholder")).attr("placeholder", "");
        });

        $("#searchText").blur(function() {
            var value = $(this).val();
            if (value == "") {
                $(this).css("color", "#D4D4D4");
            }
            $(this).attr("placeholder", $(this).data("data-pholder"));
        });

        $(".bn-srh").click(function() {
            var searchText = $("#searchText").val();
            if (searchText == null || searchText == "") {
                return false;
            }
            return true;
        });
    }

    function set_searchtext_color($element) {
        var value = $element.val();
        if (value != "") {
            $element.css("color", "black");
        } else {
            $element.css("color", "#D4D4D4");
        }
    }
});