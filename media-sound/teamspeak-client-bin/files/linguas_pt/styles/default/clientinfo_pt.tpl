<!--
TeamSpeak 3 Client Infoframe Template (EN)
Copyright 2009-2011 (c) TeamSpeak Systems GmbH

The replaceable variables are embedded in "%%" like %%CLIENT_NAME%%. At this time you can 
also use %%?CLIENT_NAME%% (note the questionmark), which is a tiny "if"- query. Use it, to 
remove the whole line, if a variable is empty or just "0".

Templates can be placed in "styles/" for default theme or in a sub folder named like an available 
theme (e.g. "styles/bluesky/"). Be aware that this template will not automaticly be translated when 
displayed.

Predefined values have to be inside the html comment-tag to make sure that they will be parsed
before the replacing begins! Remove the "#" to enable.

#%%AVATAR_MAX_WIDTH%%128
#%%AVATAR_MAX_HEIGHT%%128
#%%CLIENT_SERVER_SHOW_MAX_GROUPS%%3
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
  <tr>
    <td class="label">Nome:</td>
    <td dir="LTR">
      <img src="%%?CLIENT_COUNTRY_IMAGE%%" alt="" title="%%CLIENT_COUNTRY_TOOLTIP%%" />&nbsp;&nbsp;
      %%CLIENT_NAME%%&nbsp;
      <span class="blue" title="Alcunha">[%%?CLIENT_CUSTOM_NICK_NAME%%]</span>&nbsp;
	  <span class="small" title="ID de cliente">(%%CLIENT_ID%%)</span>
    </td>
  </tr>
  <tr>
    <td class="label">ID único:</td>
    <td>%%CLIENT_UNIQUE_ID%%</td>
  </tr>
  <tr>
    <td class="label">ID da base de dados:</td>
    <td>%%CLIENT_DATABASE_ID%%</td>
  </tr>
  <tr><td class="label">Descrição:</td><td>%%?CLIENT_DESCRIPTION%%</td></tr>
  <tr><td class="label">Modificador de volume:</td><td class="red">%%?CLIENT_VOLUME_MODIFIER%% dB</td></tr>
  <tr>
    <td class="label">Versão:</td>
    <td>%%CLIENT_VERSION%% em %%CLIENT_PLATFORM%%</td>
  </tr>
  <tr>
    <td class="label">Ligações:</td>
    <td>%%CLIENT_TOTALCONNECTIONS%%</td>
  </tr>
  <tr>
    <td class="label">Primeira vez ligado:</td>
    <td>%%CLIENT_CREATED%%</td>
  </tr>
  <tr>
    <td class="label">Última vez ligado:</td>
    <td>%%CLIENT_LASTCONNECTED%%</td>
  </tr>
</table>

<table id="list">
  <tr><td class="space label"><img src="iconpath:16x16_permissions_server_groups.png" height="12" width="12" alt=""> Grupos do servidor:</td></tr>
  <tr><td class="list">
    <div>%%CLIENT_SERVER_GROUP_ICON%% %%CLIENT_SERVER_GROUP_NAME%%</div>
  </td></tr>
  <tr><td class="space label"><img src="iconpath:16x16_permissions_channel_groups.png" height="12" width="12" alt=""> Grupos do canal:</td></tr>
  <tr><td class="list">
    <div>%%CLIENT_CHANNEL_GROUP_ICON%% %%CLIENT_CHANNEL_GROUP_NAME%%</div>
  </td></tr>
  <tr><td class="red"><br />*** Cliente pediu permissão para falar às <b>%%?CLIENT_TALK_REQUEST_TIME%%</b>.</td></tr>
  <tr><td class="red">&nbsp;&nbsp;&nbsp;&nbsp;(%%?CLIENT_TALK_REQUEST_MSG%%)</td></tr>
</table>

<table style="padding-top: 6px;">%%?PLUGIN_INFO_DATA%%</table>
