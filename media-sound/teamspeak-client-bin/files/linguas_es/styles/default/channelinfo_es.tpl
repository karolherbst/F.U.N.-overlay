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
#  <tr title="Posici&oacute;n: %%CHANNEL_ORDER%%">
  <tr>
    <td class="label">Canal:</td>
    <td dir="LTR">
      %%CHANNEL_NAME%%&nbsp;
      <span class="small" title="ID de Canal (Identificador en la base de datos)">(%%CHANNEL_ID%%)</span>
    </td>
  </tr>
  <tr><td class="label">Tema:</td><td>%%?CHANNEL_TOPIC%%</td></tr>
  <tr><td class="label">Tipo de canal:</td><td class="blue">%%?CHANNEL_FLAGS%%</td></tr>
  <tr><td class="label">Ocupaci&oacute;n actual:</td><td>%%?CHANNEL_CLIENTS_COUNT%% / %%CHANNEL_FLAG_MAXCLIENTS%%</td></tr>
  <tr><td class="label">Cifrado de voz:</td><td>%%CHANNEL_VOICE_DATA_ENCRYPTED%%</td></tr>
  <tr>
    <td class="label">C&oacute;dec:</td>
    <td>%%CHANNEL_CODEC%%
	#<br>Calidad del c&oacute;dec: %%CHANNEL_CODEC_QUALITY%%
	#<br>Velocidad de codificaci&oacute;n: %%CHANNEL_CODEC_BITRATE%%/s
	</td>
  </tr>
  <tr>
   <td class="label">Calidad del c&oacute;dec:</td>
   <td>%%CHANNEL_CODEC_QUALITY%% (velocidad de codificaci&oacute;n: %%CHANNEL_CODEC_BITRATE%%/s)</td>
  </tr>
  <tr><td class="label">Nivel para hablar:</td><td class="red"><img src="iconpath:16x16_moderated.png" height="12" width="12" alt="" title="Si su nivel no iguala o supera el nivel requerido deber&aacute; solicitar la palabra." />&nbsp;&nbsp;%%?CHANNEL_NEEDED_TALK_POWER%%</td></tr>
  <tr>
    <td class="label">Suscripci&oacute;n:</td>
    <td>%%CHANNEL_SUBSCRIPTION%%</td>
  </tr>
  %%?PLUGIN_INFO_DATA%%
</table>

<table id="list" width=100%>
  <tr><td class="space label"><img src="iconpath:16x16_change_nickname.png" height="12" width="12" alt=""> Descripci&oacute;n:</td></tr><tr><td class="list"><br />%%?CHANNEL_DESCRIPTION%%</td></tr>
</table>
