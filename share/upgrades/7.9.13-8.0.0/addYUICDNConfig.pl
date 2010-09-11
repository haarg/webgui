use WebGUI::Upgrade::Script;

start_step "Adding YUI CDN path to config";

config->set('yuiURL', "//ajax.googleapis.com/ajax/libs/yui/{{version}}/");

done;
