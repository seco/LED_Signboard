    <h1>メッセージ編集</h1>

    <form class="form-horizontal">
      <div id="common-part" class="form-group">
        <div class="form-group">
          <label class="control-label col-xs-3">MSG ID:</label>
          <span class="col-xs-1">
            <input type="text" readonly id="msg-id" class="form-control">
          </span>
        </div>
        <div class="form-group">
          <label class="control-label col-xs-3">タイトル:</label>
          <span class="col-xs-6">
            <input type="text" placeholder="Title" id="msg-title"
		   class="form-control">
          </span>
          <button id="btn-title-set" class="btn btn-secondary"
                  type="button">表示文字列からコピー
          </button>
        </div>
        <div class="form-group">
          <label class="control-label col-xs-3">メッセージ・タイプ:</label>
          <div class="col-xs-5">
            <select class="form-control" id="overlay-select">
              <option value="static-text" selected
		      target="static-text-player-part">
		静止テキスト
	      </option>
              <option value="scroll-text" target="scroll-text-player-part">
		スクロールテキスト
	      </option>
            </select>
          </div>
        </div>
	<div class="form-group">
          <label class="control-label col-xs-3">表示領域:</label>
          <div class="col-xs-8">
	    <label class="control-label col-xs-1">x:</label>
	    <span class="col-xs-2">
	      <input type="number" id="msg-rx" class="form-control" value="0">
	    </span>
	    <label class="control-label col-xs-1">y:</label>
	    <span class="col-xs-2">
	      <input type="number" id="msg-ry" class="form-control" value="0">
	    </span>
	    <label class="control-label col-xs-1">w:</label>
	    <span class="col-xs-2">
	      <input type="number" id="msg-rw" class="form-control" value="64">
	    </span>
	    <label class="control-label col-xs-1">h:</label>
	    <span class="col-xs-2">
	      <input type="number" id="msg-rh" class="form-control" value="32">
	    </span>
	  </div>
	</div>
	<div class="form-group">
          <label class="control-label col-xs-3">領域クリア:</label>
          <div class="col-xs-7">
	    <span class="col-xs-2">表示前:</span>
	    <span class="col-xs-2">
              <input type="checkbox" id="msg-pre-clear" class="form-control">
	    </span>
	    <span class="col-xs-2">表示後:</span>
	    <span class="col-xs-2">
              <input type="checkbox" id="msg-post-clear" class="form-control">
	    </span>
	    <span class="col-xs-2">背景色:</span>
	    <span class="col-xs-2">
	      <input type="color" id="msg-bg" class="form-control"
		     value="#000000">
	    </span>
	  </div>
	</div>
      </div>

      <div class="form-group" class="part-block">
        <div class="col-xs-offset-4 col-xs-8">
          <button id="btn-prev-msg" type="button" class="btn btn-secondary">
            前のメッセージ</button>
          <button id="btn-next-msg" type="button" class="btn btn-secondary">
            次のメッセージ</button>
          <button id="btn-new-msg" type="button" class="btn btn-secondary">
            新規作成</button>
          <button type="button" id="btn-write1" class="btn btn-primary">
	    書込</button>
          <button type="button" id="btn-disp1" class="btn btn-primary">
	    書込&amp;表示</button>
        </div>
      </div>

      <div id="editor-overlay-part">
        <!-- Static Text Player Part -->

        <div id="static-text-player-part" class="part-block"
	     style="display:none;">
          <h3>静止テキスト</h3>
	  <div class="form-group">
            <label class="control-label col-xs-2">フォント:</label>
	    <span class="col-xs-8">
	      <span class="col-xs-6">
		<select id="static-text-font" class="form-control">
		</select>
	      </span>
	      <label class="control-label col-xs-2">
		倍率:
	      </label>
	      <span class="col-xs-2">
		<select id="static-text-fontsize" class="form-control">
		  <option value="1" selected>1</option>
		  <option value="2">2</option>
		  <option value="3">3</option>
		  <option value="4">4</option>
		  <option value="5">5</option>
		</select>
	      </span>
	    </span>
	  </div>
          <div class="form-group">
            <label class="control-label col-xs-2">水平位置合わせ:</label>
	    <span class="col-xs-2">
	      <select id="static-text-halign" class="form-control">
		<option value="0">左</option>
		<option value="1" selected>中央</option>
		<option value="2">右</option>
	      </select>
	    </span>
	    <label class="control-label col-xs-2">
	      オフセット:
	    </label>
            <span class="col-xs-2">
              <input type="text" size="3" id="static-text-ox"
		     class="form-control" value="0">
            </span>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">垂直位置合わせ:</label>
	    <span class="col-xs-2">
	      <select id="static-text-valign" class="form-control">
		<option value="0">上</option>
		<option value="1" selected>中央</option>
		<option value="2">下</option>
	      </select>
	    </span>
	    <label class="control-label col-xs-2">
	      オフセット:
	    </label>
            <span class="col-xs-2">
              <input type="text" size="3" id="static-text-oy"
		     class="form-control" value="0">
            </span>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">表示色:</label>
            <div class="col-xs-2">
              <input type="color" id="static-text-color"
		     class="form-control" value="#ffffff">
            </div>
            <label class="control-label col-xs-2">表示時間:</label>
            <span class="col-xs-2">
              <input type="number" size="6" id="static-text-time"
		     class="form-control " value="1.0">
            </span>
            <span class="explain">単位 秒</span>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-xs-2">時間文字置き換え:</label>
	    <span class="col-xs-2">
              <input type="checkbox" id="static-text-replace"
		     class="form-control " checked>
	    </span>
	    <span class="explain">
	      % + 文字を　日付、時刻等の数字に置き換える 。<br/>
	      %Y->年,%m->月,%d->日,%a->曜日,%H->時,%M->分,%S-> 秒
	    </span>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">表示文字列:</label>
            <div class="col-xs-10">
              <input type="text" size="80" id="static-text-text"
		     class="form-control"
		     placeholder="表示する文字列を入力してください。">
            </div>
          </div>
        </div>

        <!-- Scroll Text Player Part -->

        <div id="scroll-text-player-part" class="part-block"
	     style="display:none;">
          <h3>スクロール・テキスト</h3>
	  <div class="form-group">
            <label class="control-label col-xs-2">フォント:</label>
	    <span class="col-xs-8">
	      <span class="col-xs-6">
		<select id="scroll-text-font" class="form-control">
		</select>
	      </span>
	      <label class="control-label col-xs-2">
		倍率:
	      </label>
	      <span class="col-xs-2">
		<select id="static-text-fontsize" class="form-control">
		  <option value="1" selected>1</option>
		  <option value="2">2</option>
		  <option value="3">3</option>
		  <option value="4">4</option>
		  <option value="5">5</option>
		</select>
	      </span>
	    </span>
	  </div>
          <div class="form-group">
            <label class="control-label col-xs-2">垂直位置あわせ:</label>
	    <span class="col-xs-2">
	      <select id="scroll-text-valign" class="form-control">
		<option value="0">上</option>
		<option value="1" selected>中央</option>
		<option value="2">下</option>
	      </select>
	    </span>
	    <label class="control-label col-xs-2">
	      オフセット:
	    </label>
            <span class="col-xs-2">
              <input type="text" size="3" id="scroll-text-oy"
		     class="form-control" value="0">
            </span>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">表示色:</label>
            <div class="col-xs-2">
              <input type="color" id="scroll-text-color"
		     class="form-control" value="#ffffff">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">スクロール:</label>
            <div class="col-xs-10">
	      <label class="control-label col-xs-1">
		speed:<br/>
		[dot/sec]
	      </label>
	      <span class="col-xs-2">
		<input type="number" id="scroll-text-speed"
		       class="form-control" value="32.0">
	      </span>
	      <label class="control-label col-xs-2">
		開始位置:
	      </label>
	      <span class="col-xs-2">
		<input type="number" id="scroll-text-x"
		       class="form-control" value="64">
	      </span>
	      <label class="control-label col-xs-2">
		スクロール・アウト:
	      </label>
	      <span class="col-xs-2">
		<input type="checkbox" id="scroll-text-out"
		       class="form-control" checked>
	      </span>
            </div>
          </div>
	  <div class="form-group">
	    <label class="control-label col-xs-2">時間文字置き換え:</label>
	    <span class="col-xs-2">
              <input type="checkbox" id="scroll-text-replace"
		     class="form-control " checked>
	    </span>
	    <span class="explain">
	      % + 文字を　日付、時刻等の数字に置き換える 。<br/>
	      %Y->年,%m->月,%d->日,%a->曜日,%H->時,%M->分,%S-> 秒
	    </span>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">表示文字列:</label>
            <div class="col-xs-10">
              <textarea type="text" size="80" id="scroll-text-text"
			class="form-control"
			placeholder="表示する文字列を入力してください。"
			>Scroll</textarea>
            </div>
          </div>
        </div>
        <!-- Part End -->
      </div>

      <div class="form-group" class="part-block">
        <div class="col-xs-offset-9 col-xs-3">
          <button type="button" id="btn-write2" class="btn btn-primary">
	    書込</button>
          <button type="button" id="btn-disp2" class="btn btn-primary">
	    書込&amp;表示</button>
        </div>
      </div>
    </form>
    <script src="/editPage.js"></script>
