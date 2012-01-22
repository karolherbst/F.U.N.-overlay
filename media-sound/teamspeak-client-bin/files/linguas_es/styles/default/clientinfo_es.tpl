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
    <td class="label">Usuario:</td>
    <td dir="LTR">
      <img src="%%?CLIENT_COUNTRY_IMAGE%%" alt="" title="%%CLIENT_COUNTRY_TOOLTIP%%" />&nbsp;&nbsp;
      %%CLIENT_NAME%%&nbsp;
      <span class="blue" title="Alias">[%%?CLIENT_CUSTOM_NICK_NAME%%]</span>&nbsp;
	  <span class="small" title="N&uacute;mero correlativo de conexi&oacute;n">(%%CLIENT_ID%%)</span>
	  </td>
  </tr>
  <tr><td class="label">Descripci&oacute;n:</td><td>%%?CLIENT_DESCRIPTION%%</td></tr>
  <tr><td class="label">Ajuste de volumen:</td><td class="red">%%?CLIENT_VOLUME_MODIFIER%% dB</td></tr>
  <tr>
    <td class="label">Primera conexi&oacute;n:</td>
    <td>%%CLIENT_CREATED%%</td>
  </tr>
  <tr>
    <td class="label">&Uacute;ltima conexi&oacute;n:</td>
    <td>%%CLIENT_LASTCONNECTED%%</td>
  </tr>
  <tr>
    <td class="label">Total de conexiones:</td>
    <td>%%CLIENT_TOTALCONNECTIONS%%</td>
  </tr>
  <tr>
    <td class="label">Versi&oacute;n TS3:</td>
    <td>%%CLIENT_VERSION%% sobre %%CLIENT_PLATFORM%%</td>
  </tr>
  <tr>
    <td class="label">ID &uacute;nico:</td>
    <td>%%CLIENT_UNIQUE_ID%%</td>
  </tr>
  <tr>
    <td class="label">ID base de datos:</td>
    <td>%%CLIENT_DATABASE_ID%%  (n&uacute;mero de registro)</td>
  </tr>
</table>
<table id="list">
  <tr><td><u><img src="iconpath:16x16_permissions_server_groups.png" height="14" width="14" alt=""> <b>Grupos de Servidor</b></u>
  <div><img src="iconpath:16x16_permissions_channel_groups.png" height="16" width="1" alt="">&nbsp;&nbsp;&nbsp;%%CLIENT_SERVER_GROUP_ICON%% %%CLIENT_SERVER_GROUP_NAME%%</div>
  </td>
  <td><u><img src="iconpath:16x16_permissions_channel_groups.png" height="14" width="14" alt=""> <b>Grupo de Canal</b></u>
  <div><img src="iconpath:16x16_permissions_channel_groups.png" height="16" width="1" alt="">&nbsp;&nbsp;&nbsp;%%CLIENT_CHANNEL_GROUP_ICON%% %%CLIENT_CHANNEL_GROUP_NAME%%</div>
  </td></tr>
</table>
<table>
<tr><td class="red"><b>%%?CLIENT_TALK_REQUEST_TIME%%</b> ** Petici&oacute;n de palabra **</td></tr>
<tr><td class="red"><img src="iconpath:16x16_request_talk_power" title="Motivo de la solicitud de palabra" alt=""> <b>(%%?CLIENT_TALK_REQUEST_MSG%%)</b></td></tr>
####  <tr><td class="red"><br />*** Ha pedido la palabra <b>%%?CLIENT_TALK_REQUEST_TIME%%</b>.</td></tr>
####  <tr><td class="red">&nbsp;&nbsp;&nbsp;&nbsp;(%%?CLIENT_TALK_REQUEST_MSG%%)</td></tr>
</table>
<table style="padding-top: 6px;">%%?PLUGIN_INFO_DATA%%</table>
