var FOOD = {};

FOOD.PopUp = function(){
}

FOOD.PopUp.prototype = {
  initialize: function(){
    this.login();
    this.signup();
  },

  login: function(){
    $('a.login-window').click(function() {
      $('#signup-box').fadeOut(200);
      var loginBox = $(this).attr('href');
      $(loginBox).fadeIn(300);

      var popMargTop = ($(loginBox).height() + 24) / 2;
      var popMargLeft = ($(loginBox).width() + 24) / 2;

      $(loginBox).css({
          'margin-top' : -popMargTop,
          'margin-left' : -popMargLeft
      });
    });
  },

  signup: function(){
    $('a.signup-window').click(function() {

      $('#login-box').fadeOut(200);

      var signupBox = $(this).attr('href');

      $(signupBox).fadeIn(300);

      var popMargTop = ($(signupBox).height() + 24) / 2;
      var popMargLeft = ($(signupBox).width() + 24) / 2;

      $(signupBox).css({
          'margin-top' : -popMargTop,
          'margin-left' : -popMargLeft
      });

    });
  }
}