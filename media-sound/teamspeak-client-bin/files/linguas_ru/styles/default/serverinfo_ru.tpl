<!--
TeamSpeak 3 Server Infoframe Template (EN)
Copyright 2009,2010 (c) TeamSpeak Systems GmbH
 
The replaceable variables are embedded in "%%" like %%SERVER_NAME%%. At this time you can also use 
%%?SERVER_NAME%% (note the questionmark), which is a tiny "if"- query. Use it, to remove the whole 
line, if a variable is empty or just "0".

Templates can be placed in "styles/" for default theme or in a sub folder named like an available 
theme (e.g. "styles/bluesky/"). Be aware that this template will not automaticly be translated when 
displayed.

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
  .active {
    color: green;
    text-decoration: underline;
  }
  .inactive {
    color: gray;
    text-decoration: underline;
  }
  .red {
    color: red;
  }
</style>

<table id="info">
  <tr>
    <td class="label">Название:</td>
    <td>%%SERVER_NAME%%</td>
  </tr>
  <tr>
    <td class="label">Адрес:</td>
    <td>%%SERVER_ADDRESS%%
		:%%?SERVER_PORT%%
	</td>
  </tr>
  <tr>
    <td class="label">Версия:</td>
    <td>%%SERVER_VERSION%% on %%SERVER_PLATFORM%%</td>
  </tr>
  <tr>
    <td class="label">Время работы:</td>
    <td>%%SERVER_UPTIME%%</td>
  </tr>
  <tr>
    <td class="label">Всего каналов:</td>
    <td>%%SERVER_CHANNELS_ONLINE%%</td>
  </tr>
  <tr title="Всего подключений пользователей: %%SERVER_CLIENT_CONNECTIONS%%">
    <td class="label">Пользователей:</td>
    <td>%%SERVER_CLIENTS_ONLINE%% / %%SERVER_MAXCLIENTS%% %%?SERVER_NO_RESERVED_SLOTS%%</td>
    <td>%%SERVER_CLIENTS_ONLINE%% / %%SERVER_MAXCLIENTS%% (<span class="red">-%%?SERVER_RESERVED_SLOTS%% резервных</span>)</td>
  </tr>
  <tr title="Всего подключений пользователей ServerQuery: %%SERVER_QUERY_CLIENT_CONNECTIONS%%">
    <td class="label">Пользователей SQ:</td>
    <td>%%SERVER_QUERYCLIENTS_ONLINE%% / %%SERVER_MAXCLIENTS%%</td>
  </tr>
  %%?PLUGIN_INFO_DATA%%
</table>

<table id="list">
  <tr><td class="space">
    <img src="iconpath:16x16_check_update.png" height="12" width="12" alt="">
    &nbsp;
    <a class="inactive" href="%%?SERVER_REFRESH_INACTIVE%%">Обновить</a>
    <a class="active" href="%%?SERVER_REFRESH_ACTIVE%%">Обновить</a>
  </td></tr>
</table>
