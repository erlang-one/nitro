-ifndef(NITRO_HRL).
-define(NITRO_HRL, true).

-define(DEFAULT_BASE, {?ELEMENT_BASE(undefined)}).
-define(DEFAULT_BASE_TAG(Tag), {?ELEMENT_BASE(undefined,Tag,undefined)}).
-define(ELEMENT_BASE(Module), ?ELEMENT_BASE(Module,undefined,undefined)).
-define(ELEMENT_BASE(Module,Tag,Delegate),
        ancestor=element, id, module=Module, delegate=Delegate, validation=[], validate=[], actions, class=[], style=[], source=[], onmouseover, onkeypress, onchange, onkeyup, onkeydown, onclick,
        data_fields=[], aria_states=[], body, role, tabindex, show_if=true, html_tag=Tag, title, postback=[], accesskey, contenteditable, contextmenu, dir, draggable, dropzone,
        hidden, lang, spellcheck, translate, onblur, onerror, onfocus, onmessage, onresize).
-define(ACTION_BASE(Module), ancestor=action, trigger, target, module=Module, actions, source=[]).
-define(CTRL_BASE(Module), ?ELEMENT_BASE(Module,undefined,Module)).
% SVG attribute groups
-define(SVG_ANIMATION_EVENT, onbegin, onend, onload_animation, onrepeat).
-define(SVG_ANIMATION_ATTRIBUT_TARGET, attributeType, attributeName).
-define(SVG_ANIMATION_TIMING, svgbegin, dur, svgend, min, max, restart, repeatCount, repeatDur, fill).
-define(SVG_ANIMATION_VALUE, calcMode, values, keyTimes, keySplines, from, to, by, autoReverse, accelerate, decelerate).
-define(SVG_ANIMATION_ADDITION, additive, accumulate).
-define(SVG_CONDITIONAL_PROCESSING, requiredExtensions, requiredFeatures, systemLanguage).
-define(SVG_CORE, xmlbase, xmllang, xmlspace).
-define(SVG_DOCUMENT_EVENT, onabort, onscroll, onunload_document, onzoom).  %% onerror and onresize, duplicating HTML events, were removed.
-define(SVG_FILTER_PRIMITIVE, height, result, width, x, y).
-define(SVG_GRAPHICAL_EVENT, onactivate, onfocusin, onfocusout, onload_graphical, onmousedown, onmousemove, onmouseout, onmouseup). %% onclick and onmouseover, duplicating HTML events, were removed.
-define(SVG_PRESENTATION, alignment_baseline, baseline_shift, clip, clip_path, clip_rule, color, color_interpolation, color_interpolation_filters, color_profile, color_rendering, cursor,
		direction, display, dominant_baseline, enable_background, fill, fill_opacity, fill_rule, filter, flood_color, flood_opacity, font_family, font_size, font_size_adjust, font_stretch,
		font_style, font_variant, font_weight, glyph_orientation_horizontal, glyph_orientation_vertical, image_rendering, kerning, letter_spacing, lighting_color, marker_end, marker_mid,
		marker_start, mask, opacity, overflow, pointer_events, shape_rendering, stop_color, stop_opacity, stroke, stroke_dasharray, stroke_dashoffset, stroke_linecap, stroke_linejoin,
		stroke_miterlimit, stroke_opacity, stroke_width, text_anchor, text_decoration, text_rendering, unicode_bidi, visibility, word_spacing, writing_mode).
-define(SVG_TRANSFERT_FUNCTION, type, tableValues, slope, intercept, amplitude, exponent, offset).
-define(SVG_XLINK, xlinkhref, xlinktype, xlinkrole, xlinkarcrole, xlinktitle, xlinkshow, xlinkactuate).

-record(element, {?ELEMENT_BASE(undefined)}).
-record(literal, {?ELEMENT_BASE(element_literal), html_encode=true }).
-record(dtl, {?ELEMENT_BASE(element_dtl), file="index", bindings=[], app=web, folder="priv/templates", ext="html", bind_script=true, js_escape=false }).
-record(list, {?ELEMENT_BASE(element_list), numbered=false }).
-record(dropdown, {?ELEMENT_BASE(element_dropdown), options, value, multiple=false, disabled=false, name}).
-record(radiogroup, {?ELEMENT_BASE(element_radiogroup)}).
-record(spinner, {?ELEMENT_BASE(element_spinner), image="/nitrogen/spinner.gif"}).

% HTML Document meta
-record(base,       {?ELEMENT_BASE(element_meta_base), href, target}).
-record(head,       ?DEFAULT_BASE).
-record(meta_link,       {?ELEMENT_BASE(element_meta_link), href, hreflang, media, rel, sizes, type}).
-record(meta,       {?ELEMENT_BASE(element_meta), charset, content, http_equiv, name, type}).
-record(style,       {?ELEMENT_BASE(element_style), media, scoped, type}).
-record(title,       ?DEFAULT_BASE).

% HTML Edits
-record('del',       {?ELEMENT_BASE(element_del), cite, datetime}).
-record(ins,       {?ELEMENT_BASE(element_ins), cite, datetime}).

% HTML Embedded
-record(area,       {?ELEMENT_BASE(element_area), alt, coords, href, hreflang, media, target, rel, shape, type}).
-record(audio,       {?ELEMENT_BASE(element_audio), autoplay, controls, loop, mediagroup, muted, preload, src, width}).
-record(canvas,       {?ELEMENT_BASE(element_canvas), height, width}).
-record(embed,       {?ELEMENT_BASE(element_embed), height, src, type, width}).
-record(iframe,       {?ELEMENT_BASE(element_iframe), height, name, sandbox, seamless, src, srcdoc, width}).
-record(image,       {?ELEMENT_BASE(element_image), alt, height, ismap, src, usemap, width, image}).
-record(map,       {?ELEMENT_BASE(element_map), name}).
-record(object,       {?ELEMENT_BASE(element_object), data, form, height, name, type, usemap, width}).
-record(param,       {?ELEMENT_BASE(element_param), name, value}).
-record(source,       {?ELEMENT_BASE(element_source), media, src, type}).
-record(track,       {?ELEMENT_BASE(element_track), default, kind, label, src, srclang}).
-record(video,       {?ELEMENT_BASE(element_video), autoplay, controls, height, loop, mediagroup, muted, poster, preload, src, width}).

% HTML Form
-record(button,       {?ELEMENT_BASE(element_button), autofocus, disabled, form, formaction, formenctype, formmethod, formtarget, formnovalidate, name, type= <<"button">>, value}).
-record(datalist,       ?DEFAULT_BASE).
-record(fieldset,       {?ELEMENT_BASE(element_fieldset), disabled, form, name, legend}).
-record(form,       {?ELEMENT_BASE(element_form), accept_charset, action, autocomplete, enctype, method, name, novalidate, target}).
-record(keygen,       {?ELEMENT_BASE(element_keygen), autofocus, challenge, disabled, form, keytype, name}).
-record(legend,       ?DEFAULT_BASE).
-record(label,       {?ELEMENT_BASE(element_label), for, form}).
-record(meter,       {?ELEMENT_BASE(element_meter), high, low, max, min, optimum, value}).
-record(optgroup,       {?ELEMENT_BASE(element_select), disabled, label}).
-record(option,       {?ELEMENT_BASE(element_select), disabled, label, selected=false, value}).
-record(output,       {?ELEMENT_BASE(element_output), for, form, name}).
-record(progress,       {?ELEMENT_BASE(element_progress), max, value}).
-record(select,       {?ELEMENT_BASE(element_select), autofocus, disabled, form, multiple, name, required, size}).
-record(textarea,       {?ELEMENT_BASE(element_textarea), autofocus, cols, dirname, disabled, form, maxlength, name, placeholder, readonly, required, rows, wrap, value}).

% HTML Form inputs
-record(input,       {?ELEMENT_BASE(element_input),  autofocus, disabled, form, name, value, type=[], placeholder, multiple, min, max}).
-record(input_button,       {?ELEMENT_BASE(element_input_button),  autofocus, disabled, form, name, value}).
-record(checkbox,           {?ELEMENT_BASE(element_checkbox),  autofocus, checked=false, disabled, form, name, required, value}).
-record(color,           {?ELEMENT_BASE(element_color),  autocomplete, autofocus, disabled, form, list, name, value}).
-record(date,           {?ELEMENT_BASE(element_date),  autocomplete, autofocus, disabled, form, list, max, min, name, step, readonly, required, value}).
-record(calendar,       {?ELEMENT_BASE(element_calendar),  autocomplete, autofocus, disabled, form, list, maxDate, minDate, format, name, step, readonly, required, value, placeholder}).
-record(datetime,           {?ELEMENT_BASE(element_datetime),  autocomplete, autofocus, disabled, form, list, max, min, name, step, readonly, required, value}).
-record(datetime_local,           {?ELEMENT_BASE(element_datetime_local),  autocomplete, autofocus, disabled, form, list, max, min, name, step, readonly, required, value}).
-record(email,           {?ELEMENT_BASE(element_email),  autocomplete, autofocus, disabled, form, list, maxlength, multiple, name, pattern, placeholder, readonly, required, size, value}).
-record(file,           {?ELEMENT_BASE(element_file),  accept, autofocus, disabled, form, multiple, name, required}).
-record(hidden,           {?ELEMENT_BASE(element_hidden),  disabled, form, name, value, html_name}).
-record(input_image,           {?ELEMENT_BASE(element_input_image),  alt, autofocus, disabled, form, formaction, formenctype, formmethod, formnovalue, formtarget, height, name, src, width}).
-record(month,              {?ELEMENT_BASE(element_month),  alt, autocomplite, autofocus, disabled, form, list, min, max, name, readonly, required, step, value}).
-record(number,              {?ELEMENT_BASE(element_number),  autocomplete, autofocus, disabled, form, list, max, min, name, placeholder, readonly, required, step, value}).
-record(password,              {?ELEMENT_BASE(element_password),  autocomplete, autofocus, disabled, form, maxlength, name, pattern, placeholder, readonly, required, size, value}).
-record(radio,              {?ELEMENT_BASE(element_radio),  autofocus, checked, disabled, form, name, required, value, html_name}).
-record(range,              {?ELEMENT_BASE(element_range),  autocomplete, autofocus, disabled, form, list, max=100, min=0, name, step=1, value}).
-record(reset,              {?ELEMENT_BASE(element_reset),  autofocus, disabled, form, name, value}).
-record(search,              {?ELEMENT_BASE(element_search),  autocomplete, autofocus, dirname, disabled, form, list, maxlength, name, pattern, placeholder, readonly, required, size, value}).
-record(submit,              {?ELEMENT_BASE(element_submit),  autofocus, disabled, form, formaction, formenctype, formmethod, formnovalidate, formtarget, name, value, click}).
-record(tel,              {?ELEMENT_BASE(element_tel),  autocomplete, autofocus, disabled, form, list, maxlength, name, pattern, placeholder, readonly, required, size, value}).
-record(textbox,              {?ELEMENT_BASE(element_textbox),  autocomplete, autofocus, dirname, disabled, form, list, maxlength, name, pattern, placeholder, readony, required, size, value}).
-record(input_time,              {?ELEMENT_BASE(element_input_time),  autocomplete, autofocus, disabled, form, list, max, min, name, step, readonly, required, value}).
-record(url,              {?ELEMENT_BASE(element_url),  autocomplete, autofocus, disabled, form, list, maxlength, name, pattern, placeholder, readonly, required, size, value}).
-record(week,              {?ELEMENT_BASE(element_week),  autocomplete, autofocus, disabled, form, list, max, min, name, readonly, required, step, value}).

% HTML Interactive
-record(command,       {?ELEMENT_BASE(element_command),  checked, disabled, icon, label, radiogroup, type= <<"command">>}).
-record(details,       {?ELEMENT_BASE(element_details),  open}).
-record(menu,       {?ELEMENT_BASE(element_menu),  label, type}).
-record(summary,       ?DEFAULT_BASE).

% HTML Grouping content
-record(blockquote,		{?ELEMENT_BASE(element_blockquote),  cite}).
-record(br,       		?DEFAULT_BASE).
-record(dd,       		?DEFAULT_BASE).
-record('div',      	?DEFAULT_BASE_TAG(<<"div">>)).
-record(dl,       		?DEFAULT_BASE).
-record(dt,       		?DEFAULT_BASE).
-record(figcaption,		?DEFAULT_BASE).
-record(figure,       	?DEFAULT_BASE).
-record(hr,       		?DEFAULT_BASE).
-record(li,             {?ELEMENT_BASE(element_li),  value}).
-record(ol,             ?DEFAULT_BASE).
-record(p,       		?DEFAULT_BASE).
-record(panel,          ?DEFAULT_BASE_TAG(<<"div">>)).
-record(pre,       		?DEFAULT_BASE).
-record(ul,       		?DEFAULT_BASE).

% HTML Root
-record(html,			{?ELEMENT_BASE(element_html), manifest}).

% HTML Scripting
-record(script,			{?ELEMENT_BASE(element_script),  async, charset, defer, src, type}).
-record(noscript,      	?DEFAULT_BASE).

% HTML Sections
-record(body,       	?DEFAULT_BASE).
-record(section,    	?DEFAULT_BASE).
-record(nav,        	?DEFAULT_BASE).
-record(article,    	?DEFAULT_BASE).
-record(aside,      	?DEFAULT_BASE).
-record(h1,         	?DEFAULT_BASE).
-record(h2,         	?DEFAULT_BASE).
-record(h3,         	?DEFAULT_BASE).
-record(h4,         	?DEFAULT_BASE).
-record(h5,         	?DEFAULT_BASE).
-record(h6,         	?DEFAULT_BASE).
-record(header,     	?DEFAULT_BASE).
-record(hgroup,     	?DEFAULT_BASE).
-record(footer,     	?DEFAULT_BASE).
-record(address,    	?DEFAULT_BASE).
-record(main,       	?DEFAULT_BASE).

% HTML Table
-record(caption,       	?DEFAULT_BASE).
-record(col,            {?ELEMENT_BASE(element_col),  span}).
-record(colgroup,       {?ELEMENT_BASE(element_colgroup), col, span}).
-record(table,          {?ELEMENT_BASE(element_table),  caption, colgroup, border, footer, header}).
-record(tbody,          ?DEFAULT_BASE).
-record(td, 			{?ELEMENT_BASE(element_td), colspan=1, headers, rowspan=1, scope, bgcolor}).
-record(tfoot,       	?DEFAULT_BASE).
-record(th, 			{?ELEMENT_BASE(element_th), colspan=1, headers, rowspan=1, scope}).
-record(thead,       	?DEFAULT_BASE).
-record(tr, 			{?ELEMENT_BASE(element_tr), cells}).

% HTML Text-level semantics
-record(link,           {?ELEMENT_BASE(element_link),  href, hreflang, media, rel, target, type, url="javascript:void(0);", download, name}).
-record(abbr,       	?DEFAULT_BASE).
-record(b,       		?DEFAULT_BASE).
-record(bdi,       		?DEFAULT_BASE).
-record(bdo,       		?DEFAULT_BASE).
-record(cite,       	?DEFAULT_BASE).
-record(code,       	?DEFAULT_BASE).
-record(dfn,       		?DEFAULT_BASE).
-record(em,       		?DEFAULT_BASE).
-record(i,       		?DEFAULT_BASE).
-record(kbd,       		?DEFAULT_BASE).
-record(mark,       	?DEFAULT_BASE).
-record(q,              {?ELEMENT_BASE(element_q),  cite}).
-record(rt,       		?DEFAULT_BASE).
-record(rp,       		?DEFAULT_BASE).
-record(ruby,       	?DEFAULT_BASE).
-record(s,       		?DEFAULT_BASE).
-record(samp,       	?DEFAULT_BASE).
-record(small,       	?DEFAULT_BASE).
-record(span,       	?DEFAULT_BASE).
-record(strong,       	?DEFAULT_BASE).
-record(sub,       		?DEFAULT_BASE).
-record(sup,       		?DEFAULT_BASE).
-record(time,           {?ELEMENT_BASE(element_time),  datetime}).
-record(u,       		?DEFAULT_BASE).
-record(var,       		?DEFAULT_BASE).

% HTML5 template
-record(template,		?DEFAULT_BASE).

% SVG
-record(svg, {?ELEMENT_BASE(element_svg), version="1.1", baseProfile="full", xmlns="http://www.w3.org/2000/svg", xmlnsxlink="http://www.w3.org/1999/xlink", xmlnsev="http://www.w3.org/2001/xml-events", preserveAspectRatio, contentScriptType, contentStyleType, viewBox, externalResourcesRequired, ?SVG_CONDITIONAL_PROCESSING, ?SVG_CORE, ?SVG_DOCUMENT_EVENT, ?SVG_FILTER_PRIMITIVE, ?SVG_GRAPHICAL_EVENT, ?SVG_PRESENTATION, ?SVG_TRANSFERT_FUNCTION, ?SVG_XLINK}).

% Extras
-record(upload,         {?CTRL_BASE(element_upload), name, value}).

% Actions
-record(action,  {?ACTION_BASE(undefined)}).
-record(wire,    {?ACTION_BASE(action_wire)}).
-record(api,     {?ACTION_BASE(action_api), name, tag, delegate }).
-record(event,   {?ACTION_BASE(action_event), type=default, postback, delegate, validation=[]}).
-record(bind,    {?ACTION_BASE(action_bind), type=click, postback=[]}).
-record(alert,   {?ACTION_BASE(action_alert), text}).
-record(confirm, {?ACTION_BASE(action_confirm), text, postback, delegate}).
-record(jq,      {?ACTION_BASE(action_jq), property, method, args=[], right, format="~s"}).
-record(transfer,{?ACTION_BASE(action_transfer), state, events=[] }).

-endif.
