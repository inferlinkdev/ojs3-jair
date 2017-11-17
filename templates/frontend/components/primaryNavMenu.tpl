{*
* templates/frontend/components/primaryNavMenu.tpl
*
* Copyright (c) 2014-2016 Simon Fraser University Library
* Copyright (c) 2003-2016 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* Primary navigation menu list for OJS
*}
<ul id="main-navigation" class="nav navbar-nav">

  {if $enableAnnouncements}
  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}">
      {translate key="announcement.announcements"}
    </a>
  </li>
  {/if}

  {if $currentJournal}

  {if $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
      <!--{translate key="navigation.current"}-->
      CURRENT VOLUME
    </a>
  </li>
  <li>
    <a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
      {translate key="navigation.archives"}
    </a>
  </li>
  {/if}
  <li class="dropdown">
    <a href="{url router=$smarty.const.ROUTE_PAGE page="awards"}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Special Tracks <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="awardedpapers"}">
          Best Papers Award Track
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="bestpaper"}">
          IJCAI-JAIR Best Paper Awards
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="surveypapers"}">
          Survey Papers Track
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack_ai_society"}">
          Special Track on AI & Society
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack_dlkrr-call"}">
          Special Track on Deep Learning, Knowledge Representation, and Reasoning
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack_HumanComputationAndAI"}">
          Special Track on Human Computation and AI
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack_claa"}">
          Special Track on Cross-language Algorithms and Applications
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack_DescriptionLogics"}">
          Special Track on Description Logics
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack_NonmonotonicReasoning"}">
          Special Track on Nonmonotonic Reasoning
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack-ipc4"}">
          4th International Planning Competition
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="specialtrack-ipc3"}">
          3rd International Planning Competition
        </a>
      </li>
    </ul>
  </li>
  <li class="dropdown">
    <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{translate key="navigation.about"} <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
          {translate key="about.aboutContext"}
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}">
          {translate key="about.editorialTeam"}
        </a>
      </li>
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
          {translate key="about.submissions"}
        </a>
      </li>       
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="News"}">
          News
        </a>
      </li>       
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="faq"}">
          FAQ
        </a>
      </li>       
      {if $currentJournal->getSetting('mailingAddress') || $currentJournal->getSetting('contactName')}
      <li>
        <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
                    {translate key="about.contact"}
        </a>
      </li>
      {/if}
    </ul>
  </li>
  {/if}
</ul>
