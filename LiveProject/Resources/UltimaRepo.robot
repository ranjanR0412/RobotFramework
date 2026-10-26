*** Variables ***
#searchBar
${searchBar}    id=searchCtrl
${placeHolderUltime}    xpath=//input[@placeholder='Ask RAIma...']
${inputTextUltimaSearchBar}    xpath=//input[contains(@placeholder,'Ask RAIma')]
${searchBoxOptions}    xpath=//div[@class='app-title' and contains(text(),'{}')]

#userProfile
${userIcon}    id=profile-photo
${designation}    xpath=//div[@class='designation_section'][2]//span[1]
${closeBtn}    xpath=//img[@class='cross-img']
