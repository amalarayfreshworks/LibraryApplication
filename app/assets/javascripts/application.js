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
//= require jquery
//= require rails-ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
function openNav() {
	if (document.getElementById("mySidenav").style.width == '' || document.getElementById("mySidenav").style.width == '0px' ){
    	document.getElementById("mySidenav").style.width = "250px";
    	document.getElementById("pageContent").style.marginLeft = "350px";
    	document.getElementById("newItemButton").style.marginLeft = "450px";
    }else
    	closeNav()
    	
	}
function closeNav() {
    	document.getElementById("mySidenav").style.width = "0";
    	document.getElementById("pageContent").style.marginLeft = "100px";
    	document.getElementById("newItemButton").style.marginLeft = "550px";
	}

$(document).ready(function(){
    $(document).on('click','.btn-filter',function(e){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

     $(document).on('keyup','.filterable .filters input',function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('table'),
        $rows = $table.find('tbody tr');
         var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
     $(document).on('change',"select[name*= 'book[book_damaged]']",function(e){
        txt = $("select[name*= 'book[book_damaged]'] option:selected").text();
        if (txt == "Damaged"){
           $("select[name*= 'book[book_avail_in_lib]").empty().append($('<option></option>').attr('value', false).text('Unavailable'));
        }else{
             $("select[name*= 'book[book_avail_in_lib]").empty().append($('<option></option>').attr('value', true).text('Available'))
                                .append($('<option></option>').attr('value', false).text('Unavailable'));


        }
     });
});