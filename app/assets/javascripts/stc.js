$(function () {
        $('.pagination a').click(function () {
		   Type_is = document.getElementById('type_is').value ;
                $.get(this.href, {type_is:Type_is}, null, 'script');
                return false;
        });
        $('#type_is').change(function () {
		   Type_is = document.getElementById('type_is').value ;
                $.get('/posts', {type_is:Type_is} , null, 'script');
                return false;
        });
});

function AddComment(Post) {
	$('#add_comment_button').hide()
    $.get('/posts/add_comment', 
          { post:Post, type_is:'<%= @type_is %>' },         
          function(data) {
            $("#comment").html(data);
          });
  }

function AddAttachment(Post) {
	$('#add_comment_button').hide()
    $.get('/posts/add_attachment', 
          { post:Post, type_is:'<%= @type_is %>' },         
          function(data) {
            $("#comment").html(data);
          });
  }
