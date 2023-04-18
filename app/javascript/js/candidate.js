$(document).ready(function(){
    $("#CountryFilter").niceSelect();
    $("#CategoryFilter").niceSelect();

    var city_name = $("#cityFilter")[0].value != '' ? $("#cityFilter")[0].value : []
    var category_name = $("#CategoryFilter")[0].value != '' ? $("#CategoryFilter")[0].value : []
    var skill_array = []

    // js for filter by city and category.// js for filter by city and category
    $("#cityFilter , #CategoryFilter ").on('change', function(e){      
        city_name = $("#cityFilter")[0].value != '' ? $("#cityFilter")[0].value : []
        category_name = $("#CategoryFilter")[0].value != '' ? $("#CategoryFilter")[0].value : []
        req_ajax(skill_array, city_name, category_name) 
    });

    // js for clear filter
    $("#clearCity").on('click', function(){
        $('#citySearch div span')[0].innerText = 'Select'
        $("#cityFilter")[0].value = ''
        city_name = ''
        req_ajax(skill_array, city_name, category_name)
        $('#citySearch div ul input')[0].value = ''

        $("#citySearch div ul input").trigger('keyup') 
    })

    $("#clearCategory").on('click', function(){
        $('#categorySearch div span')[0].innerText = 'Select'
        $("#CategoryFilter")[0].value = ''
        category_name = ''
        req_ajax(skill_array, city_name, category_name)
    })
    // js for filter by skills.
    function skill_filter(){
        skill_array = []
        var inp = $("#showMoreSkill input")
        var inp_len = $("#showMoreSkill input").length
        for( let j=0; j< inp_len; j++){
            if (inp[j].type == "checkbox" && inp[j].checked){
                skill_array.push(inp[j].defaultValue)
            }
        }   
        req_ajax(skill_array, city_name, category_name)                
    }

    // js for ajax request.
    function req_ajax(skill_array, city_name, category_name){
        $.ajax({
            type: "GET",
            url: "/filter/candidates",
            data: {"city_name": city_name, "category_name": category_name, "skill_array": skill_array}
        });
    }

    // js for search field inside city select tag.
        $("#citySearch div:last ul li:first").before('<input type="text" class="search_field form-control" placeholder="Search.." onclick="event.stopPropagation()"/>')

        $(".search_field").on('keyup', function(e){
        var sear_val = $(this).val().toLocaleLowerCase().trim();
        
            $("#citySearch div:last ul li").filter(function() {
                
            $(this).toggle($(this).text().trim().toLowerCase().indexOf(sear_val.trim().toLowerCase()) > -1);
            // $(this).parent().toggle();

        });
   
    })  

    // js for checkbox input tag checked
    $('#filterBox input').on('change', function(e){
        var val =  e.currentTarget.value;
        var bool = e.currentTarget.checked;
        $('#showMoreSkill').find("input[value='" + val + "']")[0].checked = bool;
        skill_filter()

    })

    // js for checkbox input tag checked
    $('#showMoreSkill input').on('change', function(e){
        var val =  e.currentTarget.value;
        var bool = e.currentTarget.checked;
        $('#filterBox').find("input[value='" + val + "']")[0].checked = bool;
        skill_filter()

    })

    // js clearing filter from skills checkbox.
    $("#clear_skill").on('click', function(){
        $("#showMoreSkill").find("input").filter(":checkbox:checked").prop("checked", false);
        $("#filterBox").find("input").filter(":checkbox:checked").prop("checked", false);
        skill_filter()
    })
})