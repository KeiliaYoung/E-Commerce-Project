App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    // this function would always be triggered when another user sends a message.
    $(".alert.alert-info").show();
    // console.log(data);
    $('.product-reviews').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  listen_to_comments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});


// This will make sure listen_to_comments() is called every single time the user loads a new page.

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});


// App is what you defined inside your product.js before.
// App.product represents the subscriber object for the product channel.
// As long as you're inside the object of the create() function, you can also simply refer to App.product as this.
//perform() expects at least one argument.
