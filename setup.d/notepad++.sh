#!/bin/sh

VERSION="6.5.3"

cd /tmp/

[ -f "npp.$VERSION.Installer.exe" ] || \
	wget "http://download.tuxfamily.org/notepadplus/$VERSION/npp.$VERSION.Installer.exe"

chmod +x npp.$VERSION.Installer.exe
	
./npp.$VERSION.Installer.exe /S

if cd "$(cygpath "$APPDATA")" && ! [ -e "Notepad++/config.xml" ]
then
	mkdir -p "Notepad++"
	cat Notepad++/config.xml <<"EOF"
<?xml version="1.0" encoding="Windows-1252" ?>
<NotepadPlus>
    <GUIConfigs>
        <!-- 3 status : "large", "small" or "hide"-->
        <GUIConfig name="ToolBar" visible="yes">standard</GUIConfig>
        <!-- 2 status : "show" or "hide"-->
        <GUIConfig name="StatusBar">show</GUIConfig>
        <!-- For all attributs, 2 status : "yes" or "no"-->
        <GUIConfig name="TabBar" dragAndDrop="yes" drawTopBar="yes" drawInactiveTab="yes" reduce="yes" closeButton="yes" doubleClick2Close="no" vertical="no" multiLine="no" hide="no" />
        <!-- 2 positions : "horizontal" or "vertical"-->
        <GUIConfig name="ScintillaViewsSplitter">vertical</GUIConfig>
        <!-- For the attribut of position, 2 status : docked or undocked ; 2 status : "show" or "hide" -->
        <GUIConfig name="UserDefineDlg" position="undocked">hide</GUIConfig>
        <GUIConfig name="TabSetting" size="4" replaceBySpace="no" />
        <!--App position-->
        <GUIConfig name="AppPosition" x="408" y="17" width="1336" height="992" isMaximized="no" />
        <!-- For the primary scintilla view,
             2 status for Attribut lineNumberMargin, bookMarkMargin, indentGuideLine and currentLineHilitingShow: "show" or "hide"
             4 status for Attribut folderMarkStyle : "simple", "arrow", "circle" and "box"  -->
        <GUIConfig name="ScintillaPrimaryView" lineNumberMargin="show" bookMarkMargin="show" folderMarkStyle="box" indentGuideLine="show" currentLineHilitingShow="show" Wrap="no" edge="no" edgeNbColumn="100" wrapSymbolShow="hide" zoom="0" whiteSpaceShow="hide" eolShow="hide" lineWrapMethod="aligned" disableAdvancedScrolling="no" zoom2="0" borderWidth="2" />
        <!-- For the secodary scintilla view,
             2 status for Attribut lineNumberMargin, bookMarkMargin, indentGuideLine and currentLineHilitingShow: "show" or "hide"
             4 status for Attribut folderMarkStyle : "simple", "arrow", "circle" and "box" -->
        <GUIConfig name="Auto-detection">yes</GUIConfig>
        <GUIConfig name="CheckHistoryFiles">no</GUIConfig>
        <GUIConfig name="TrayIcon">no</GUIConfig>
        <GUIConfig name="RememberLastSession">no</GUIConfig>
        <!--
			New Document default settings :
				format = 0/1/2 -> win/unix/mac
				encoding = 0/1/2/3/4/5 -> ANSI/UCS2Big/UCS2small/UTF8/UTF8-BOM
				defaultLang = 0/1/2/..

			Note 1 : UTF8-BOM -> UTF8 without BOM
			Note 2 : for defaultLang :
					0 -> L_TXT
					1 -> L_PHP
					... (see source file)
		-->
        <GUIConfig name="NewDocDefaultSettings" format="0" encoding="4" lang="0" codepage="-1" openAnsiAsUTF8="yes" />
        <GUIConfig name="langsExcluded" gr0="0" gr1="0" gr2="0" gr3="0" gr4="0" gr5="0" gr6="0" gr7="0" langMenuCompact="yes" />
        <!--
		printOption is print colour setting, the following values are possible :
			0 : WYSIWYG
			1 : Invert colour
			2 : B & W
			3 : WYSIWYG but without background colour
		-->
        <GUIConfig name="Print" lineNumber="no" printOption="0" headerLeft="$(FULL_CURRENT_PATH)" headerMiddle="" headerRight="$(LONG_DATE) $(TIME)" headerFontName="IBMPC" headerFontStyle="1" headerFontSize="8" footerLeft="" footerMiddle="-$(CURRENT_PRINTING_PAGE)-" footerRight="" footerFontName="" footerFontStyle="0" footerFontSize="9" margeLeft="0" margeTop="0" margeRight="0" margeBottom="0" />
        <!--
                            Backup Setting :
                                0 : non backup
                                1 : simple backup
                                2 : verbose backup
                      -->
        <GUIConfig name="Backup" action="0" useCustumDir="no" dir="" isSnapshotMode="no" snapshotBackupTiming="7000" />
        <GUIConfig name="TaskList">yes</GUIConfig>
        <GUIConfig name="SaveOpenFileInSameDir">no</GUIConfig>
        <!--
			value 0 for the folloing parameters means invisible :
			leftWidth, topHight, rightWidth, bottomHight
			
					position value for the PluginDlg:
						
						0 : left
						 1 : right
						2 : top
						3 : bottom
						>= 4 : undocked -> FloatingWindow id
			-->
        <GUIConfig name="noUpdate" intervalDays="15" nextUpdateDate="20141006">no</GUIConfig>
        <GUIConfig name="MaitainIndent">yes</GUIConfig>
        <GUIConfig name="MRU">yes</GUIConfig>
        <GUIConfig name="URL">2</GUIConfig>
        <GUIConfig name="globalOverride" fg="no" bg="no" font="no" fontSize="no" bold="no" italic="no" underline="no" />
        <GUIConfig name="auto-completion" autoCAction="0" triggerFromNbChar="1" funcParams="no" />
        <GUIConfig name="multiInst" setting="0" />
        <GUIConfig name="sessionExt"></GUIConfig>
        <GUIConfig name="SmartHighLight">yes</GUIConfig>
        <GUIConfig name="SmartHighLightCaseSensitive">no</GUIConfig>
        <GUIConfig name="TagsMatchHighLight" TagAttrHighLight="yes" HighLightNonHtmlZone="no">yes</GUIConfig>
        <GUIConfig name="auto-insert" parentheses="no" brackets="no" curlyBrackets="no" quotes="no" doubleQuotes="no" htmlXmlTag="no" />
        <GUIConfig name="MenuBar">show</GUIConfig>
        <GUIConfig name="Caret" width="1" blinkRate="250" />
        <GUIConfig name="ScintillaGlobalSettings" enableMultiSelection="no" />
        <GUIConfig name="openSaveDir" value="0" defaultDirPath="" />
        <GUIConfig name="titleBar" short="no" />
        <!--GUIConfig name="stylerTheme" path="C:\Users\Ferkv\AppData\Roaming\Notepad++\stylers.xml" /-->
        <GUIConfig name="delimiterSelection" leftmostDelimiter="40" rightmostDelimiter="41" delimiterSelectionOnEntireDocument="no" />
        <GUIConfig name="MISC" fileSwitcherWithoutExtColumn="no" backSlashIsEscapeCharacterForSql="yes" />
        <GUIConfig name="DetectEncoding">yes</GUIConfig>
        <GUIConfig name="DockingManager" leftWidth="200" rightWidth="200" topHeight="200" bottomHeight="200">
            <ActiveTabs cont="0" activeTab="-1" />
            <ActiveTabs cont="1" activeTab="-1" />
            <ActiveTabs cont="2" activeTab="-1" />
            <ActiveTabs cont="3" activeTab="-1" />
        </GUIConfig>
    </GUIConfigs>
    <!-- The History of opened files list -->
    <FindHistory nbMaxFindHistoryPath="10" nbMaxFindHistoryFilter="10" nbMaxFindHistoryFind="10" nbMaxFindHistoryReplace="10" matchWord="no" matchCase="no" wrap="yes" directionDown="yes" fifRecuisive="yes" fifInHiddenFolder="no" dlgAlwaysVisible="no" fifFilterFollowsDoc="no" fifFolderFollowsDoc="no" searchMode="0" transparencyMode="1" transparency="150" dotMatchesNewline="no">
    </FindHistory>
    <History nbMaxFile="15" inSubMenu="no" customLength="-1">
    </History>
    <ProjectPanels>
        <ProjectPanel id="0" workSpaceFile="" />
        <ProjectPanel id="1" workSpaceFile="" />
        <ProjectPanel id="2" workSpaceFile="" />
    </ProjectPanels>
</NotepadPlus>	

EOF
	
else
	echo "The notepad++ configuration wasn't set"
	echo "(either it existed already, or we couldn't access '$APPDATA')"
fi








