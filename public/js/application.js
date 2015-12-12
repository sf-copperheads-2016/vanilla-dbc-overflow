$(document).ready(function(){
  create_q_comment();
});

var create_comment = function(){
  $('input[type="submit"]').on('click', function(e){
    e.preventDefault();
    var formData = $('#submit_question').serialize();
    console.log(formData);
    var request = $.ajax({
      method: 'POST',
      url: "/questions",
      data: formData,
      dataType: 'JSON',
    });
    request.done(function(response){
      $('.body').append()
    })
  });
}

// $(document).ready(function() {

  //addAnswer
  // $('form#new-answer-form button#answer-submit').on('click',function(event){
  //   event.preventDefault();
  //   var new_comment = $.ajax({
  //     type: "POST",
  //     url: '/questions/<%= @question.id %>',
  //   });
  //   $('article.answers').append()
  // });
// $(*** new comment button on post ***).click(addComment());
  // $(*** upvote button ***).click(voteSubmit(1));
  // $(*** downvote button ***).click(voteSubmit(-1))
// });



// var addAnswer = function(){
//   // 'div class="comments"><p>Comments:</p><p><%= comment.body %></p></div>'
//   // - clicking submit on the answer form adds the answer to the DB and appends to the answer area
// };

// var addComment = function(){
  // - clicking on new comment button on post replaces button with new comment form.
  //   - submission replaces form with the button while appending the comment and adding it to the DB
// };

// var voteSubmit = function(value){
  // value is there for vote value so this can be used for both up and down votes
  // - On all posts -> clicking vote button will run a vote method with an argument of 1 for up and -1 for down
  //   -vote method takes an argument and finds the post, and changes the vote_sum by the value of the argument.
  //     aka +1/-1
  //     ?change color of button where appropriate?
  // change vote sum on page
// };




//---------------------------------
// +var createPost = function(selector) {
// +  $(selector).submit(function(event){
// +    event.preventDefault()
// +
// +      var modded_title = $(this).serialize()
// +      console.log(modded_title)
// +    var create = $.ajax({
// +      method: "POST",
// +      url: '/posts',
// +      data: {title: modded_title},
// +      dataType:'json',
// +    });
// +
// +    create
// +    create.done( function(response){
// +      console.log(response.title)
// +
// +      var form = "<article id="+ response.id +"><a href=/posts/"+ response.id + "/vote' class='fa fa-sort-desc vote-button'></a><h2><a href='/posts/"+response.id+"'>"+ response.title +"</a></h2><p><span class='points'>0</span><span class='username'>"+ response.username +"</span><span class='timestamp'>"+ response.created_at + "</span><span class='comment-count'>"+ response.comment_count +"</span><a class='delete' href='/posts/"+response.id+"'></a></p></article>"
// +    // console.log(form)
// +
// +      $('.post-container').append(form)
// +
// +
// +
// +    })
// +
// +  });
// +};


