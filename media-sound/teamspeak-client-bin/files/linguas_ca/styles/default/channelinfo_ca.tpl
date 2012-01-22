<!--
TeamSpeak 3 Channel Infoframe Template (EN) 
Copyright 2009-2011 (c) TeamSpeak Systems GmbH
 
The replaceable variables are embedded in "%%" like %%CHANNEL_NAME%%. At this time you can also use 
%%?CHANNEL_NAME%% (note the questionmark), which is a tiny "if"- query. Use it, to remove the whole 
line, if a variable is empty or just "0".

Templates can be placed in "styles/" for default theme or in a sub folder named like an available 
theme (e.g. "styles/bluesky/"). Be aware that this template will not automaticly be translated when 
displayed.

Predefined values have to be inside the html comment-tag to make sure that they will be parsed
before the replacing begins! Remove the "#" to enable.

#%%IMAGES_MAX_WIDTH%%256
#%%IMAGES_MAX_HEIGHT%%256
-->

<style type="text/css">
  table#info {
    border-collapse: collapse;
    border-spacing: 0px;
  }
  table#list {
    border-collapse: collapse;
    border-spacing: 0px;
	margin-bottom: 10px;
  }
  td {
    padding: 0px 4px 0px 1px;
  }
  td.label {
    font-weight: bold;
	white-space: nowrap;
  }
  td.space {
    padding-top: 6px;
  }
  td.list {
    padding: 0px 1px 0px 8px;
  }
  .blue {
    color: blue;
  }
  .green {
    color: green;
  }
  .red {
    color: red;
  }
  .small {
    font-size: 9px;
  }
</style>

<table id="info">
 # title="Ordre del Canal : %%CHANNEL_ORDER%%"       'comentari: he traspasat el <tr> a la l�nia d'abaix
 <tr>  
 <td class="label">Canal :</td>
    <td dir="LTR">
      %%CHANNEL_NAME%%&nbsp;
      <span class="small" title="ID del Canal">(%%CHANNEL_ID%%)</span>
    </td>
  </tr>
  <tr><td class="label">Tema :</td><td>%%?CHANNEL_TOPIC%%</td></tr>
  <tr>
    <td class="label">C&ograve;dec d'audio :</td>
    <td>%%CHANNEL_CODEC%%</td>
  </tr>
  <tr>
    <td class="label">Qualitat d'audio :</td>
    <td>%%CHANNEL_CODEC_QUALITY%% (velocitat estimada : %%CHANNEL_CODEC_BITRATE%%/s)</td>
  </tr>
  <tr><td class="label">Etiquetes :</td><td class="blue">%%?CHANNEL_FLAGS%%</td></tr>
  <tr><td class="label">Usuaris al canal :</td><td>%%?CHANNEL_CLIENTS_COUNT%% / %%CHANNEL_FLAG_MAXCLIENTS%%</td></tr>
  <tr><td class="label">Nivell de veu necessari :</td><td class="red"><img src="iconpath:16x16_moderated.png" height="12" width="12" alt="" title="Has de demanar la paraula per poder parlar en aquest canal." />&nbsp;&nbsp;%%?CHANNEL_NEEDED_TALK_POWER%%</td></tr>
  <tr>
    <td class="label">Subscripci&oacute; :</td>
    <td>%%CHANNEL_SUBSCRIPTION%%</td>
  </tr>
  <tr><td class="label">Veu Xifrada :</td><td>%%CHANNEL_VOICE_DATA_ENCRYPTED%%</td></tr>
  %%?PLUGIN_INFO_DATA%%
</table>

<table id="list" width=100%>
  <tr><td class="space label"><img src="iconpath:16x16_change_nickname.png" height="12" width="12" alt=""> Descripci&oacute; :</td></tr><tr><td class="list"><br />%%?CHANNEL_DESCRIPTION%%</td></tr>
</table>
