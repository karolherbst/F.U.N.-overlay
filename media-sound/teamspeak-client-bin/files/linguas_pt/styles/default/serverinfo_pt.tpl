<!--
TeamSpeak 3 Server Infoframe Template (EN)
Copyright 2009-2011 (c) TeamSpeak Systems GmbH
 
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
    <td class="label">Nome:</td>
    <td>%%SERVER_NAME%%</td>
  </tr>
  <tr>
    <td class="label">Endereço:</td>
    <td>%%SERVER_ADDRESS%%
		:%%?SERVER_PORT%%
	</td>
  </tr>
  <tr>
    <td class="label">Versão:</td>
    <td>%%SERVER_VERSION%% em %%SERVER_PLATFORM%%</td>
  </tr>
  <tr>
    <td class="label">Tempo de ligação:</td>
    <td>%%SERVER_UPTIME%%</td>
  </tr>
  <tr>
    <td class="label">Canais actuais:</td>
    <td>%%SERVER_CHANNELS_ONLINE%%</td>
  </tr>
  <tr title="Ligações de clientes: %%SERVER_CLIENT_CONNECTIONS%%">
    <td class="label">Clientes actuais:</td>
    <td>%%SERVER_CLIENTS_ONLINE%% / %%SERVER_MAXCLIENTS%% %%?SERVER_NO_RESERVED_SLOTS%%</td>
    <td>%%SERVER_CLIENTS_ONLINE%% / %%SERVER_MAXCLIENTS%% (<span class="red">-%%?SERVER_RESERVED_SLOTS%% reservado(s)</span>)</td>
  </tr>
  <tr title="Ligações de Query: %%SERVER_QUERY_CLIENT_CONNECTIONS%%">
    <td class="label">Clientes de Query actuais:</td>
    <td>%%SERVER_QUERYCLIENTS_ONLINE%% / %%SERVER_MAXCLIENTS%%</td>
  </tr>
  %%?PLUGIN_INFO_DATA%%
</table>

<table id="list">
  <tr><td class="space">
    <img src="iconpath:16x16_check_update.png" height="12" width="12" alt="">
    &nbsp;
    <a class="inactive" href="%%?SERVER_REFRESH_INACTIVE%%">Actualizar</a>
    <a class="active" href="%%?SERVER_REFRESH_ACTIVE%%">Actualizar</a>
  </td></tr>
</table>
