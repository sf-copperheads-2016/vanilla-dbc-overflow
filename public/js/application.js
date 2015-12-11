$(document).ready(function() {

  $('form#new-answer-form button#answer-submit').click(addAnswer());
  // $(*** new comment button on post ***).click(addComment());
  // $(*** upvote button ***).click(voteSubmit(1));
  // $(*** downvote button ***).click(voteSubmit(-1))
});



var addAnswer = function(){
  // - clicking submit on the answer form adds the answer to the DB and appends to the answer area
};

var addComment = function(){
  // - clicking on new comment button on post replaces button with new comment form.
  //   - submission replaces form with the button while appending the comment and adding it to the DB
};

var voteSubmit = function(value){
  // value is there for vote value so this can be used for both up and down votes
  // - On all posts -> clicking vote button will run a vote method with an argument of 1 for up and -1 for down
  //   -vote method takes an argument and finds the post, and changes the vote_sum by the value of the argument.
  //     aka +1/-1
  //     ?change color of button where appropriate?
  // change vote sum on page
};

// var SOMETHING = function(){};

