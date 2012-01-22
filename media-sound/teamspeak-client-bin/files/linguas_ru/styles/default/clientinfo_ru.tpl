<!--
TeamSpeak 3 Client Infoframe Template (EN)
Copyright 2009,2010 (c) TeamSpeak Systems GmbH

The replaceable variables are embedded in "%%" like %%CLIENT_META_DATA%%. At this time you can 
also use %%?CLIENT_META_DATA%% (note the questionmark), which is a tiny "if"- query. Use it, to 
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
    <td class="label">Псевдоним:</td>
    <td>
      <img src="%%?CLIENT_COUNTRY_IMAGE%%" alt="" title="%%CLIENT_COUNTRY_TOOLTIP%%" />&nbsp;&nbsp;
      %%CLIENT_NAME%%&nbsp;
      <span class="blue" title="Желаемый псевдоним">[%%?CLIENT_CUSTOM_NICK_NAME%%]</span>&nbsp;
	  <span class="small" title="Идентификатор пользователя">(%%CLIENT_ID%%)</span>
    </td>
  </tr>
  <tr>
    <td class="label">Уникальный ID:</td>
    <td>%%CLIENT_UNIQUE_ID%%</td>
  </tr>
  <tr>
    <td class="label">Номер в базе ID:</td>
    <td>%%CLIENT_DATABASE_ID%%</td>
  </tr>
  <tr><td class="label">Описание:</td><td>%%?CLIENT_DESCRIPTION%%</td></tr>
  <tr><td class="label">Уровень громкости:</td><td class="red">%%?CLIENT_VOLUME_MODIFIER%% dB</td></tr>
  <tr>
    <td class="label">Версия:</td>
    <td>%%CLIENT_VERSION%% on %%CLIENT_PLATFORM%%</td>
  </tr>
  <tr>
    <td class="label">Всего подключений:</td>
    <td>%%CLIENT_TOTALCONNECTIONS%%</td>
  </tr>
  <tr>
    <td class="label">Первое подключение:</td>
    <td>%%CLIENT_CREATED%%</td>
  </tr>
  <tr>
    <td class="label">Последнее подключение:</td>
    <td>%%CLIENT_LASTCONNECTED%%</td>
  </tr>
</table>

<table id="list">
  <tr><td class="space label"><img src="iconpath:16x16_permissions_server_groups.png" height="12" width="12" alt=""> Группа сервера:</td></tr>
  <tr><td class="list">
    <div>%%CLIENT_SERVER_GROUP_ICON%% %%CLIENT_SERVER_GROUP_NAME%%</div>
  </td></tr>
  <tr><td class="space label"><img src="iconpath:16x16_permissions_channel_groups.png" height="12" width="12" alt=""> Группа канала:</td></tr>
  <tr><td class="list">
    <div>%%CLIENT_CHANNEL_GROUP_ICON%% %%CLIENT_CHANNEL_GROUP_NAME%%</div>
  </td></tr>
  <tr><td class="red"><br />***  Пользователь запросил право голоса в <b>%%?CLIENT_TALK_REQUEST_TIME%%</b>.</td></tr>
  <tr><td class="red">&nbsp;&nbsp;&nbsp;&nbsp;(%%?CLIENT_TALK_REQUEST_MSG%%)</td></tr>
</table>

<table style="padding-top: 6px;">%%?PLUGIN_INFO_DATA%%</table>