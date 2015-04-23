/**
 * Created by Natan Elia on 4/21/2015.
 */

/** Getter and Setter for Categories Length */
function getCategoriesLength() {
    return localStorage.getItem("categoriesLength");
}
function setCategoriesLength(length) {
    localStorage.setItem("categoriesLength",length);
}

/** Getter and Setter for Category Name */
function getCategoryName(index) {
    return localStorage.getItem("cat-"+index);
}
function setCategoryName (index,categoryName) {
    localStorage.setItem("cat-"+index, categoryName);
}

/** Getter and Setter for Category Keywords */
function getCategoryKeywords(index) {
    return localStorage.getItem("cat-name-"+getCategoryName(index));
}
function setCategoryKeywords (categoryName,keywords) {
    localStorage.setItem("cat-name-"+categoryName, keywords.replace(/, /g,","));
}

/** Adder and Remover for Category */
function addCategory(categoryName,keywords) {
    setCategoryName(getCategoriesLength(),categoryName);
    setCategoryKeywords(categoryName,keywords);
    setCategoriesLength(parseInt(getCategoriesLength())+1);
}

function removeCategory(index) {
    var i;
    for (i = index+1; i < getCategoriesLength(); i++) {
        setCategoryName(i-1,getCategoryName(i));
    }
    setCategoriesLength(parseInt(getCategoriesLength())-1);
    localStorage.removeItem("cat-" + getCategoriesLength());
}

function removeEmptyCategories() {
    var i;
    for (i = getCategoriesLength()-1; i >= 0; i--) {
        if (localStorage.getItem("cat-" + i) == "") {
            removeCategory(i);
        }
    }
}

/** Printer to HTML */
function getCategoryNames() {
    var htmlContent = '';
    var i;
    var categoriesLength = getCategoriesLength();
    for (i = 0; i < categoriesLength - 1; ++i) {
        if (getCategoryName(i) != "") {
            htmlContent += getCategoryName(i) + ' | ';
        }
    }
    htmlContent += getCategoryName(i);

    return htmlContent;
}

function getCategoriesHtml() {
    var htmlContent = '';
    var i;
    var categoriesLength = getCategoriesLength();
    for (i = 0; i < categoriesLength; ++i) {
        if (getCategoryName() != "") {
            htmlContent += '' +
            '<div class="row" style="padding-top:10px">' +
            '   <div class="col-md-3"></div>' +
            '   <div class="col-md-6">' +
            '       <div class="col-md-2"></div>' +
            '       <div class="col-md-8">' +
            '           <div class="input-group">' +
            '               <div class="input-group">' +
            '                   <input type="text" name="cat-' + i + '" id="cat-name-' + i + '" class="form-control text-center" style="color:#fff;background-color:#5bc0de;font-weight:bold" placeholder="insert name..." value="' + (getCategoryName(i) || "") + '">' +
            '                   <div class="input-group-btn"><button type="button" class="btn btn-danger" id="cat-remove-' + i + '">X</button></div>' +
            '               </div>' +
            '               <input type="text" name="cat-keywords-' + i + '" id="cat-keywords-' + i + '" class="form-control" placeholder="insert relevant keywords..." value="' + (getCategoryKeywords(i) || "") + '">' +
            '           </div>' +
            '       </div>' +
            '       <div class="col-md-2"></div>' +
            '    </div>' +
            '    <div class="col-md-3"></div>' +
            '</div>';
        }
    }

    return htmlContent;
}

/** Default values setter for categories */
function setDefaultCategories() {
    if (getCategoriesLength() <= 0) {
        setCategoryName(0,"Film");
        setCategoryName(1,"Music");
        setCategoryKeywords("","");
        setCategoryKeywords("Film","film, movie, hollywood, box office, action, crime, drama, romance");
        setCategoryKeywords("Music","music, mp3, avicii, beyonce, chris brown, coldplay, drake, ed sheeran, ellie goulding, eminem, iggy azalea, jason derulo, justin timberlake, katy perry, maroon 5, miley cyrus, taylor swift")
        setCategoryKeywords("Game", "game,wts,wtb,lol");
        setCategoriesLength(2);

        return true;
    }
    else { return false; }
}

function clearCategories() {
    localStorage.clear();
}

$(document).ready(function() {
    removeEmptyCategories();

    $('#category-list').html(getCategoriesHtml());
    $('#selected-category-names').html(getCategoryNames);

    $('#add-new-category-button').click(function() {
        addCategory("","");
        $('#category-list').html(getCategoriesHtml());
        turnOnCategoryAutoComplete();
        turnOnRemoveCategory()
    });

    function turnOnRemoveCategory() {
        $('[id^="cat-remove-"]').click(function () {
            var sp = this.id.split("-");
            var id = sp[sp.length - 1];
            removeCategory(parseInt(id));
            $('#category-list').html(getCategoriesHtml());
            turnOnCategoryAutoComplete();
            turnOnRemoveCategory()
        });
    }
    turnOnRemoveCategory();

    $('#search-form').submit(function() {
        removeEmptyCategories();
        $('#category-list').html(getCategoriesHtml());
        var i;
        var categoriesLength = getCategoriesLength();
        for (i = 0; i < categoriesLength; ++i) {
            var categoryName = $('#cat-name-' + i).val();
            setCategoryName(i,categoryName);
            setCategoryKeywords(categoryName, $('#cat-keywords-' + i).val());
        }
    });


    function turnOnCategoryAutoComplete() {
        $('[id^="cat-name-"]').on('input', function () {
            var sp = this.id.split("-");
            var id = sp[sp.length - 1];
            var keywords = localStorage.getItem("cat-name-" + this.value);
            if (keywords != null) {
                $('#cat-keywords-' + id).val(keywords);
                setCategoryName(id, this.value);
                $('#selected-category-names').html(getCategoryNames);
            }
        });
    }
    turnOnCategoryAutoComplete();
});
