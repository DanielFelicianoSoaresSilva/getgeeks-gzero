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
    Fill search form        Sim         Matricial a fita colorida
    Submit search form

    Geek should be found        ${alien}

    Alien icon should be visible

Search for commom geek

    ${common}        Factory User        search_common
    
    Create geek profile as a service  ${common}

    ${searcher}     Factory User    searcher
    Do login        ${searcher}

    Go to geeks
    Fill search form        Não         Instalo Distros Ubuntu
    Submit search form

    Geek should be found        ${common}

Search not found

    ${searcher}     Factory User    searcher
    Do login        ${searcher}

    Go to geeks
    Fill search form            Não         Conserto Game Atari ou da Polivox
    Submit search form
    Search alert should be      Não encontramos Geeks com o(s) termo(s) informado na busca!
    