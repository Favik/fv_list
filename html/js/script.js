$(function() {
    window.addEventListener('message', function(OpenPaper) {
        switch (OpenPaper.data.action) {
            case 'enable':
                $('#paper').fadeIn();
                $('#title').html(OpenPaper.data.title);
                $('#text').html(OpenPaper.data.text);
                break;
        }
    });

	$("#close").click(function () {
        $('#paper').fadeOut();
        $.post('http://fv_paper/closePaper');
    })
    document.addEventListener('keyup', (e) => {
        if(e.key == 'Escape') {
            $('#paper').fadeOut();
            $.post('http://fv_paper/closePaper');
        }
    });

})