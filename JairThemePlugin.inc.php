<?php
import('lib.pkp.classes.plugins.ThemePlugin');
class JairThemePlugin extends ThemePlugin {

    /**
     * Load the custom styles for our theme
     * @return null
     */
    public function init() {
	$this->setParent('bootstrapthreethemeplugin');

        $this->addStyle('stylesheet', 'styles/index.less');

        HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));
    }

    /**
     * Get the display name of this theme
     * @return string
     */
    function getDisplayName() {
        return __('plugins.themes.jair-theme.name');
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription() {
        return __('plugins.themes.jair-theme.description');
    }

    public function loadTemplateData($hookName, $args) {

        // Retrieve the TemplateManager and the template filename
        $templateMgr = $args[0];
        $template = $args[1];

        // Don't do anything if we're not loading the right template
        if ($template != 'frontend/pages/indexJournal.tpl') {
            return;
        }

        $publishedArticleDao = DAORegistry::getDAO('PublishedArticleDAO');
        $articles =& $publishedArticleDao->getPublishedArticlesByJournalId($journalId = null, $rangeInfo = null, $reverse = true);
        $templateMgr->assign('articles', $articles->toArray());
    }
}
