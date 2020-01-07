<#import "parts/common.ftl" as c>
<@c.page>
    <#if patternName??>
        <div>Название: ${patternName}</div>
    </#if>
    <form method="post">
        <div class="form-row">
            <div class="form-group col-md-6">
                <input type="text" name="personalName" class="form-control" placeholder="Название" id="personalName">
            </div>
            <div class="form-group col-md-6">
                <input type="text" name="author" class="form-control"  placeholder="Имя автора" id="author">
            </div>
            <div class="form-group col-md-6" >
                <div>Количество событий</div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-secondary active">
                        <input type="radio" name="icons" value="1" id="1" autocomplete="off" checked> 1
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icons" value="2" id="2" autocomplete="off"> 2
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icons" value="3" id="3" autocomplete="off"> 3
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icons" value="4" id="4" autocomplete="off"> 4
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icons" value="5" id="5" autocomplete="off"> 5
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icons" value="6" id="6" autocomplete="off"> 6
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icons" value="7" id="7" autocomplete="off"> 7
                    </label>
                </div>
            </div>
            <div class="form-group col-md-6">
                <div>Цвет заднего фона</div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-secondary active">
                        <input type="radio" name="color" value="white" id="1" autocomplete="off" checked>
                        <i class="fas fa-square" style="color: white"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="color" value="peachpuff" id="2" autocomplete="off">
                        <i class="fas fa-square" style="color: peachpuff"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="color" value="lavender" id="3" autocomplete="off">
                        <i class="fas fa-square" style="color: lavender"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="color" value="silver" id="4" autocomplete="off">
                        <i class="fas fa-square" style="color: silver"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="color" value="lightcyan" id="5" autocomplete="off">
                        <i class="fas fa-square" style="color:lightcyan;"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="color" value="lightskyblue" id="6" autocomplete="off">
                        <i class="fas fa-square" style="color:lightskyblue;"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="color" value="mistyrose" id="7" autocomplete="off">
                        <i class="fas fa-square" style="color: mistyrose"></i>
                    </label>
                </div>
            </div>

            <div class="form-group col-md-6" >
                <div>Выберите иконку</div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <p>
                    <label class="btn btn-secondary active">
                        <input type="radio" name="icon" value="angry" id="1" autocomplete="off" checked>
                        <i class="fas fa-angry"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="apple-alt" id="2" autocomplete="off">
                        <i class="fas fa-apple-alt"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="archive" id="3" autocomplete="off">
                        <i class="fas fa-archive"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="ban" id="5" autocomplete="off">
                        <i class="fas fa-ban"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="battery-full" id="6" autocomplete="off">
                        <i class="fas fa-battery-full"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="bath" id="7" autocomplete="off">
                        <i class="fas fa-bath"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="baseball-ball" id="8" autocomplete="off">
                        <i class="fas fa-baseball-ball"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="bed" id="9" autocomplete="off">
                        <i class="fas fa-bed"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="bell" id="10" autocomplete="off">
                        <i class="fas fa-bell"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="bomb" id="11" autocomplete="off">
                        <i class="fas fa-bomb"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="bone" id="12" autocomplete="off">
                        <i class="fas fa-bone"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="book" id="13" autocomplete="off">
                        <i class="fas fa-book"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="briefcase-medical" id="15" autocomplete="off">
                        <i class="fas fa-briefcase-medical"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="camera" id="16" autocomplete="off">
                        <i class="fas fa-camera"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="capsules" id="17" autocomplete="off">
                        <i class="fas fa-capsules"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="chess-knight" id="21" autocomplete="off">
                        <i class="fas fa-chess-knight"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="coins" id="22" autocomplete="off">
                        <i class="fas fa-coins"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="cookie" id="23" autocomplete="off">
                        <i class="fas fa-cookie"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="crow" id="24" autocomplete="off">
                        <i class="fas fa-crow"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="fish" id="26" autocomplete="off">
                        <i class="fas fa-fish"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="frown" id="27" autocomplete="off">
                        <i class="fas fa-frown"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="heart" id="29" autocomplete="off">
                        <i class="fas fa-heart"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="hourglass-end" id="30" autocomplete="off">
                        <i class="fas fa-hourglass-end"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="meh" id="31" autocomplete="off">
                        <i class="fas fa-meh"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="paw" id="32" autocomplete="off">
                        <i class="fas fa-paw"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="circle" id="33" autocomplete="off">
                        <i class="fas fa-plus-circle"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="rocket" id="34" autocomplete="off">
                        <i class="fas fa-rocket"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="umbrella" id="35" autocomplete="off">
                        <i class="fas fa-umbrella"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="trophy" id="36" autocomplete="off">
                        <i class="fas fa-trophy"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="smile" id="37" autocomplete="off">
                        <i class="fas fa-smile"></i>
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="icon" value="sad-cry" id="38" autocomplete="off">
                        <i class="fas fa-sad-cry"></i>
                    </label>
                    </p>
                </div>
            </div>

        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Готово</button>
    </form>
</@c.page>