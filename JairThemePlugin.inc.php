<?php
import('lib.pkp.classes.plugins.ThemePlugin');
class JairThemePlugin extends ThemePlugin {

    /**
     * Load the custom styles for our theme
     * @return null
     */
    public function init() {
	$this.setParent('bootstrapthreethemeplugin');

        $this->addStyle('stylesheet', 'styles/index.less');
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
}
