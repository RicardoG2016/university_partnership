// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require jquery
//= require tether
//= require bootstrap
//= require jquery_ujs
//= require messages_form
//= require pickadate/picker
//= require pickadate/picker.date
//= require pickadate/picker.time
//= require turbolinks
//= require materialize-sprockets
//= require_tree ./channels
//= require_*


$(document).ready(function() {

  $('.submit_on_enter').keydown(function(event) {
    // enter has keyCode = 13, change it if you want to use another button
    if (event.keyCode == 13) {
      this.form.submit();
    }
  });

  $('#datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });

  $('#timepicker').pickatime({
    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
    fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
    twelvehour: true, // Use AM/PM or 24-hour format
    donetext: 'OK', // text for done-button
    cleartext: 'Clear', // text for clear-button
    canceltext: 'Cancel', // Text for cancel-button
    autoclose: false, // automatic close timepicker
    ampmclickable: true, // make AM PM clickable
    aftershow: function(){} //Function for after opening timepicker
  });

  $('body').on('click', '.error-icon', function(e) {
    $(this).parent().closest('div').hide();
  });


// Materialize drop down menu settings for university pick list on new group
  $('select').material_select();

  $('input.select-dropdown').on('click', function(){
    var menu = $(this).data('clicked', true);
    var label = $(this.parentElement.parentElement.firstElementChild)

// Materialize animations
    $(label).addClass('active')
// Show menu 
    $('.dropdown-content').css({ 'opacity': '1', 'display': 'block', 'color': '#555'})
    
    var placeholder = menu.siblings('ul').children('li')
    $(placeholder).click(function(){
      $('.dropdown-content').css({'display': 'none'});
    })
    
// Hides the menu when user clicks away
    $('body').click(function(){
      $('.dropdown-content').css({'display': 'none'});      
      if ( ($(placeholder[0]).hasClass('selected')) ) {
        $(label).removeClass('active');
      } else {}
    });
  })

  //Creates New Post using AJAX request
  $("#new_post").on( "submit", function( event ) {
    event.preventDefault();
    data = $(this).serialize();
    $.ajax({
      url: '/posts',
      type: 'post',
      data: data,
      cache: false,
    }).done(function(server_data){
      console.log("success: " + server_data);
      //Prepends the new post to the post feed, uses ES6
      $("#post_feed").prepend(
        `
        <div id="effects" class="posts col-md-12">                                  
            <a href="/posts/${server_data.id}">
              <div>
                <div class="edit-icons">        
                  <a class="highlight" data-method="get" href="/posts/${server_data.id}/edit">
                    <i class="material-icons edit-icon">edit_mode</i>
                  </a>
                  <a class="highlight" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/posts/19">
                    <i class="highlight material-icons edit-icon delete-icon">delete</i>
                  </a>            
                </div>
                <div id="img-post" class="row">
                  <div id="img-in-post" class="">
                    <span style="padding-right: 10px;">
                      <img class="avatar" src="https://logo.clearbit.com/${server_data.img_url}/?size='50x50'">
                    </span>
                  </div>              
                  <div id="text-post" class="">
                    <h3 class="card-title"><a class="highlight" href="/posts/${server_data.id}">${server_data.body}</a></h3>
                    <span class="card-text post-text"><a class="highlight" href="/groups/1">${server_data.university}</a></span><br>    
                  </div>              
                </div>             
            
                <hr>
          
                <div id="social">
                  <a class="waves-effect social-btn waves-light blue btn" rel="nofollow" data-method="put" href="/posts/${server_data.id}/like">
                    <i class="material-icons left">favorite</i>0
                  </a>            
                </div>

              </div>                  
          </a>        
        </div>
        `
      );
    }).fail(function(jqXHR, textStatus, errorThrown){
      console.log("fail: " + errorThrown);
      return "There was an issue with your request please try again.";;
    });
  });


  // if ($('#wrapper').hasClass('toggled')){
  //   $('#menu-toggle').on('click', function(e){
  //     $('#sidebar-wrapper').css('width', '99px');
  // })    
  // } else {
  //   $('#menu-toggle').on('click', function(e){
  //     $('#sidebar-wrapper').css('width', '220px');
  //   })
  // }

});


