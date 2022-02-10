*Settings*
Documentation       Search for Geeks test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Session

*Test Cases*
Search for alien geek

    ${alien}        Factory User    search_alien
    
    Create geek profile as a service  ${alien}

    ${searcher}     Factory User    searcher
    Do login        ${searcher}

    Go to geeks

    Fill search form        ${EMPTY}         Removo Baidu
    Submit search form

    #temporario
    Sleep   5
