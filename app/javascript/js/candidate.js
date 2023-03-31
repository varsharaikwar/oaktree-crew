$(document).ready(function(){
    $("#CountryFilter").niceSelect();
    $("#CategoryFilter").niceSelect();

    let city_name = $("#cityFilter")[0].value != '' ? $("#cityFilter")[0].value : []
    let category_name = $("#CategoryFilter")[0].value != '' ? $("#CategoryFilter")[0].value : []
    let skill_array = []

    // js for filter by city and category.// js for filter by city and category
    $("#cityFilter , #CategoryFilter ").on('change', function(e){      
        city_name = $("#cityFilter")[0].value != '' ? $("#cityFilter")[0].value : []
        category_name = $("#CategoryFilter")[0].value != '' ? $("#CategoryFilter")[0].value : []
        req_ajax(skill_array, city_name, category_name) 
    });

    // js for filter by skills.
    function skill_filter(){
        debugger;
        skill_array = []
        var inp = $("#showMoreSkill").children()
        var inp_len = inp.length
        for( let j=0; j< inp_len; j++){
            if (inp[j].children[0].nodeName == "INPUT" && inp[j].children[0].checked){
                skill_array.push(inp[j].children[0].defaultValue)
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
        var len = $('#showMoreSkill input').length

        for( let i=0; i<5; i++)
        {
            if ($('#filterBox input')[i].checked ==true)
            {
            $('#showMoreSkill input')[i].checked = true;
            }
            else{
            $('#showMoreSkill input')[i].checked = false;
            }
        }
        skill_filter()
    })

    // js for checkbox input tag checked
    $('#showMoreSkill input').on('change', function(e){
       var len = $('#filterBox input').length

        for(let i=0; i<len; i++)
        {
            if ($('#showMoreSkill input')[i].checked ==true)
            {
                $('#filterBox input')[i].checked = true;
            }
            else{
                $('#filterBox input')[i].checked = false;
            }
        }
        skill_filter()
    })
})