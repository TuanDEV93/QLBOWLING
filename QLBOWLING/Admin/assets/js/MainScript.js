$(document).ready(function () {
    // Function to load content via AJAX
    function loadPage(url, push = true) {
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'html',
            success: function (data) {
                var content = $(data).find('#content').html();
                if (content.length > 0) {
                    if (push) {
                        history.pushState({ path: url }, '', url);
                    }
                    $('#content').html(content);
                    // Reinitialize events or plugins for new content
                    reinitializeEvents();
                } else {
                    var msg = "Sorry but there was an error: No content found.";
                    $("#content").html(msg);
                }
            },
            error: function (xhr, status, error) {
                var msg = "Sorry but there was an error: " + xhr.status + " " + xhr.statusText;
                $("#content").html(msg);
            }
        });
    }

    // Handle click events and prevent full page reload
    $('a[data-ajax="true"]').click(function (e) {
        e.preventDefault();
        var url = $(this).attr('href');
        loadPage(url);
    });

    // Handle browser back and forward buttons
    window.onpopstate = function (event) {
        if (event.state) {
            loadPage(event.state.path, false);
        }
    };

    // Function to reinitialize events or plugins for new content
    function reinitializeEvents() {
        // Example: Reinitialize click event for buttons inside loaded content
        $('#content button').click(function (e) {
            e.preventDefault();
            var url = $(this).attr('data-url');
            if (url) {
                loadPage(url);
            }
        });
    }

    // Load default page content
    loadPage('Dashboard.aspx');
});
