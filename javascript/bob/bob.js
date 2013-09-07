module.exports = function () {
  'use strict';

  var isSilence, isYelling, isQuestion;

  isSilence = function (message) {
    return !message.match(/\S/);
  };

  isYelling = function (message) {
    return !message.match(/[a-z]/);
  };

  isQuestion = function (message) {
    return !message.match(/[^?]$/);
  };

  return {
    hey: function (message) {
      if (isSilence(message)) { return 'Fine. Be that way!'; }
      if (isYelling(message)) { return 'Woah, chill out!'; }
      if (isQuestion(message)) { return 'Sure.'; }
      return 'Whatever.';
    }
  };
};
