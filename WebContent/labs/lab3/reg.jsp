<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html >
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register page</title>

<link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">

<!--Datapick-->
<link rel="stylesheet" type="text/css"
	href="jquery.datepick.package-5.0.1/jquery.datepick.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery.datepick.package-5.0.1/jquery.plugin.js"></script>
<script type="text/javascript"
	src="jquery.datepick.package-5.0.1/jquery.datepick.js"></script>


<style type="text/css">
.note {
	font-size: 13px;
	font-family: helvetica, arial, sans-serif;
	color: #F2913D;
	font-weight: normal;
}

* {
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
	<jsp:include page="/exercises.jsp"></jsp:include>
	<div class="container">

		<div class="clearfix"></div>

		<div class="clearfix"></div>

		<div class="clearfix"></div>

		<div
			style="height: 50px; background: #752C7D; border-radius: 10px 10px 0 0; margin: 20px 0 0 0;"
			class=" col-sm-12">
			<h3 style="color: #FFF; text-align: center; font-weight: bold;">Create
				Account</h3>
		</div>
		<!-- <%=request.getContextPath()%>/ -->
		<form action="validate" method="post"
			style="background-image: url('images/backgroundpage'); padding: 20px 0 0 0; margin: 0px 0 0 0; float: left;"
			class="form-horizontal col-sm-12">
			<!--Xứ lý from-->
			<jsp:scriptlet>String errAccount = (String) request.getAttribute("errAccount");
			String errName = (String) request.getAttribute("errName");
			String errEmail = (String) request.getAttribute("errEmail");
			String errPass = (String) request.getAttribute("errPass");
			String errConfirmPass = (String) request.getAttribute("errConfirmPass");
			String errPhone = (String) request.getAttribute("errPhone");

			if (errAccount == null) {
				errAccount = "Dùng đăng nhập vào hệ thống";
			}

			if (errName == null) {
				errName = "Nhập chính xác họ tên bạn";
			}

			if (errEmail == null) {
				errEmail = "Email bạn hay dùng";

			}
			if (errPass == null) {
				errPass = "Mật khẩu từ 6-20 ký tự";
			}
			if (errConfirmPass == null) {
				errConfirmPass = "Xác nhận mật khẩu";
			}
			if (errPhone == null) {
				errPhone = "Số điện thoại bao gồm 11 số bất kỳ từ 0-9";
			}

			//Không dùng session đâu

			String account = (String) request.getParameter("account");

			String email = (String) request.getAttribute("email");

			String name = (String) request.getAttribute("name");
			String pass = (String) request.getAttribute("pass");
			String confirmPass = (String) request.getAttribute("confirmPass");
			String phone = (String) request.getAttribute("phone");

			if (email == null) {
				email = "";
			}
			if (account == null) {
				account = "";
			}
			if (name == null) {
				name = "";
			}
			if (pass == null) {
				pass = "";
			}
			if (confirmPass == null) {
				confirmPass = "";
			}
			if (phone == null) {
				phone = "";
			}</jsp:scriptlet>


			<div class="form-group">
				<label class="control-label col-sm-2" for="account">Username
					<span style="color: red;">(*)</span>
				</label>
				<div class="col-sm-6">
					<input name="account" value="<%=account%>" class="form-control"
						name="account" id="account" placeholder="Enter user name">
				</div>
				<label class=" col-sm-4 note"><%=errAccount%></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pass">Password<span
					style="color: red;">(*)</span></label>
				<div class="col-sm-6">
					<input name="pass" value="<%=pass%>" type="password"
						class="form-control" id="pass" placeholder="Enter password">
				</div>
				<label class="col-sm-4 note"><%=errPass%></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="confirmPass">Confirm
					password<span style="color: red;">(*)</span>
				</label>
				<div class="col-sm-6">
					<input value="<%=confirmPass%>" type="password" name="confirmPass"
						class="form-control" id="confirmPass"
						placeholder="Confirm password">
				</div>
				<label class="col-sm-4 note"><%=errConfirmPass%></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email <span
					style="color: red;">(*)</span>
				</label>
				<div class="col-sm-6">
					<input name="email" value="<%=email%>" type="email"
						class="form-control" id="email" placeholder="example@gmail.com">
				</div>
				<label class="col-sm-4 note"><%=errEmail%></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Full name <span
					style="color: red;">(*)</span>
				</label>
				<div class="col-sm-6">
					<input value="<%=name%>" type="text" class="form-control" id="name"
						name="name" placeholder="Alex Join">
				</div>
				<label class="col-sm-4 note"> <%=errName%>
				</label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Gender </label>
				<div class="col-sm-6">
					<label class="radio-inline col-sm-2"> <input
						checked="checked" type="radio" name="optradio">Male
					</label> <label class="radio-inline col-sm-2"> <input type="radio"
						name="optradio">Female
					</label>
					<!--<div class="col-sm-6">
					 <label class="">Date of birth</label> <input type="text" 
							id="configPicker" size="10"
							data-datepick="showOtherMonths: true, firstDay: 1, dateFormat: 'dd-mm-yyyy', 
        minDate: 'new Date(2012, 12 - 1, 25)'">
					</div>-->
					<label class="col-sm-4 note"> </label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-1">
					<label for="sel1">Date of birth</label>
				</div>
				<div class="col-xs-1">
					<select class="form-control" id="sel1">
						<%
							for (int i = 1; i < 32; i++) {
								out.print("<option value=\"" + i + "\">" + i + "</option>");
							}
						%>
					</select>
				</div>
				<div class="col-xs-1">
					<select class="form-control" id="sel1">
						<%
							for (int i = 1; i <= 12; i++) {
								out.print("<option value=\"" + i + "\">" + i + "</option>");
							}
						%>
					</select>
				</div>
				<div class="col-xs-2">
					<select class="form-control" id="sel1">
						<%
							for (int i = 2019; i > 0; i--) {
								out.print("<option value=\"" + i + "\">" + i + "</option>");
							}
						%>
					</select>
				</div>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">Phone
					number <span style="color: red;">(*)</span>
				</label>
				<div class="col-sm-6">
					<input value="<%=phone%>" n name="phone" type="text"
						class="form-control" id="phone" placeholder="01690000000">
				</div>
				<label class="col-sm-2 note"><%=errPhone%></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="country">Country
				</label>
				<div class="col-sm-6">
					<select class="form-control" id="country">
						<%
							String[] countries = {"Afghanistan", "Åland Islands", "Albania", "Algeria", "American Samoa", "Andorra",
									"Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia",
									"Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium",
									"Belize", "Benin", "Bermuda", "Bhutan", "Bolivia, Plurinational State of",
									"Bonaire, Sint Eustatius and Saba", "Bosnia and Herzegovina", "Bosnia and Herzegovina", "Botswana",
									"Viet Nam"};
							for (String country : countries) {
								out.print("<option value=\"" + country + "\">" + country + "</option>");
							}
						%>
						<!--  
						<option value="VN" selected="selected">Viet Nam</option>
						<option value="GB">United Kingdom</option>
						<option value="US">United States</option>
						<option value="AF">Afghanistan</option>
						<option value="AX">Åland Islands</option>
						<option value="AL">Albania</option>
						<option value="DZ">Algeria</option>
						<option value="AS">American Samoa</option>
						<option value="AD">Andorra</option>
						<option value="AO">Angola</option>
						<option value="AI">Anguilla</option>
						<option value="AQ">Antarctica</option>
						<option value="AG">Antigua and Barbuda</option>
						<option value="AR">Argentina</option>
						<option value="AM">Armenia</option>
						<option value="AW">Aruba</option>
						<option value="AU">Australia</option>
						<option value="AT">Austria</option>
						<option value="AZ">Azerbaijan</option>
						<option value="BS">Bahamas</option>
						<option value="BH">Bahrain</option>
						<option value="BD">Bangladesh</option>
						<option value="BB">Barbados</option>
						<option value="BY">Belarus</option>
						<option value="BE">Belgium</option>
						<option value="BZ">Belize</option>
						<option value="BJ">Benin</option>
						<option value="BM">Bermuda</option>
						<option value="BT">Bhutan</option>
						<option value="BO">Bolivia, Plurinational State of</option>
						<option value="BQ">Bonaire, Sint Eustatius and Saba</option>
						<option value="BA">Bosnia and Herzegovina</option>
						<option value="BW">Botswana</option>
						<option value="BV">Bouvet Island</option>
						<option value="BR">Brazil</option>
						<option value="IO">British Indian Ocean Territory</option>
						<option value="BN">Brunei Darussalam</option>
						<option value="BG">Bulgaria</option>
						<option value="BF">Burkina Faso</option>
						<option value="BI">Burundi</option>
						<option value="KH">Cambodia</option>
						<option value="CM">Cameroon</option>
						<option value="CA">Canada</option>
						<option value="CV">Cape Verde</option>
						<option value="KY">Cayman Islands</option>
						<option value="CF">Central African Republic</option>
						<option value="TD">Chad</option>
						<option value="CL">Chile</option>
						<option value="CN">China</option>
						<option value="CX">Christmas Island</option>
						<option value="CC">Cocos (Keeling) Islands</option>
						<option value="CO">Colombia</option>
						<option value="KM">Comoros</option>
						<option value="CG">Congo</option>
						<option value="CD">Congo, the Democratic Republic of the</option>
						<option value="CK">Cook Islands</option>
						<option value="CR">Costa Rica</option>
						<option value="CI">Côte d'Ivoire</option>
						<option value="HR">Croatia</option>
						<option value="CU">Cuba</option>
						<option value="CW">Curaçao</option>
						<option value="CY">Cyprus</option>
						<option value="CZ">Czech Republic</option>
						<option value="DK">Denmark</option>
						<option value="DJ">Djibouti</option>
						<option value="DM">Dominica</option>
						<option value="DO">Dominican Republic</option>
						<option value="EC">Ecuador</option>
						<option value="EG">Egypt</option>
						<option value="SV">El Salvador</option>
						<option value="GQ">Equatorial Guinea</option>
						<option value="ER">Eritrea</option>
						<option value="EE">Estonia</option>
						<option value="ET">Ethiopia</option>
						<option value="FK">Falkland Islands (Malvinas)</option>
						<option value="FO">Faroe Islands</option>
						<option value="FJ">Fiji</option>
						<option value="FI">Finland</option>
						<option value="FR">France</option>
						<option value="GF">French Guiana</option>
						<option value="PF">French Polynesia</option>
						<option value="TF">French Southern Territories</option>
						<option value="GA">Gabon</option>
						<option value="GM">Gambia</option>
						<option value="GE">Georgia</option>
						<option value="DE">Germany</option>
						<option value="GH">Ghana</option>
						<option value="GI">Gibraltar</option>
						<option value="GR">Greece</option>
						<option value="GL">Greenland</option>
						<option value="GD">Grenada</option>
						<option value="GP">Guadeloupe</option>
						<option value="GU">Guam</option>
						<option value="GT">Guatemala</option>
						<option value="GG">Guernsey</option>
						<option value="GN">Guinea</option>
						<option value="GW">Guinea-Bissau</option>
						<option value="GY">Guyana</option>
						<option value="HT">Haiti</option>
						<option value="HM">Heard Island and McDonald Islands</option>
						<option value="VA">Holy See (Vatican City State)</option>
						<option value="HN">Honduras</option>
						<option value="HK">Hong Kong</option>
						<option value="HU">Hungary</option>
						<option value="IS">Iceland</option>
						<option value="IN">India</option>
						<option value="ID">Indonesia</option>
						<option value="IR">Iran, Islamic Republic of</option>
						<option value="IQ">Iraq</option>
						<option value="IE">Ireland</option>
						<option value="IM">Isle of Man</option>
						<option value="IL">Israel</option>
						<option value="IT">Italy</option>
						<option value="JM">Jamaica</option>
						<option value="JP">Japan</option>
						<option value="JE">Jersey</option>
						<option value="JO">Jordan</option>
						<option value="KZ">Kazakhstan</option>
						<option value="KE">Kenya</option>
						<option value="KI">Kiribati</option>
						<option value="KP">Korea, Democratic People's Republic of</option>
						<option value="KR">Korea, Republic of</option>
						<option value="KW">Kuwait</option>
						<option value="KG">Kyrgyzstan</option>
						<option value="LA">Lao People's Democratic Republic</option>
						<option value="LV">Latvia</option>
						<option value="LB">Lebanon</option>
						<option value="LS">Lesotho</option>
						<option value="LR">Liberia</option>
						<option value="LY">Libya</option>
						<option value="LI">Liechtenstein</option>
						<option value="LT">Lithuania</option>
						<option value="LU">Luxembourg</option>
						<option value="MO">Macao</option>
						<option value="MK">Macedonia, the former Yugoslav
							Republic of</option>
						<option value="MG">Madagascar</option>
						<option value="MW">Malawi</option>
						<option value="MY">Malaysia</option>
						<option value="MV">Maldives</option>
						<option value="ML">Mali</option>
						<option value="MT">Malta</option>
						<option value="MH">Marshall Islands</option>
						<option value="MQ">Martinique</option>
						<option value="MR">Mauritania</option>
						<option value="MU">Mauritius</option>
						<option value="YT">Mayotte</option>
						<option value="MX">Mexico</option>
						<option value="FM">Micronesia, Federated States of</option>
						<option value="MD">Moldova, Republic of</option>
						<option value="MC">Monaco</option>
						<option value="MN">Mongolia</option>
						<option value="ME">Montenegro</option>
						<option value="MS">Montserrat</option>
						<option value="MA">Morocco</option>
						<option value="MZ">Mozambique</option>
						<option value="MM">Myanmar</option>
						<option value="NA">Namibia</option>
						<option value="NR">Nauru</option>
						<option value="NP">Nepal</option>
						<option value="NL">Netherlands</option>
						<option value="NC">New Caledonia</option>
						<option value="NZ">New Zealand</option>
						<option value="NI">Nicaragua</option>
						<option value="NE">Niger</option>
						<option value="NG">Nigeria</option>
						<option value="NU">Niue</option>
						<option value="NF">Norfolk Island</option>
						<option value="MP">Northern Mariana Islands</option>
						<option value="NO">Norway</option>
						<option value="OM">Oman</option>
						<option value="PK">Pakistan</option>
						<option value="PW">Palau</option>
						<option value="PS">Palestinian Territory, Occupied</option>
						<option value="PA">Panama</option>
						<option value="PG">Papua New Guinea</option>
						<option value="PY">Paraguay</option>
						<option value="PE">Peru</option>
						<option value="PH">Philippines</option>
						<option value="PN">Pitcairn</option>
						<option value="PL">Poland</option>
						<option value="PT">Portugal</option>
						<option value="PR">Puerto Rico</option>
						<option value="QA">Qatar</option>
						<option value="RE">Réunion</option>
						<option value="RO">Romania</option>
						<option value="RU">Russian Federation</option>
						<option value="RW">Rwanda</option>
						<option value="BL">Saint Barthélemy</option>
						<option value="SH">Saint Helena, Ascension and Tristan da
							Cunha</option>
						<option value="KN">Saint Kitts and Nevis</option>
						<option value="LC">Saint Lucia</option>
						<option value="MF">Saint Martin (French part)</option>
						<option value="PM">Saint Pierre and Miquelon</option>
						<option value="VC">Saint Vincent and the Grenadines</option>
						<option value="WS">Samoa</option>
						<option value="SM">San Marino</option>
						<option value="ST">Sao Tome and Principe</option>
						<option value="SA">Saudi Arabia</option>
						<option value="SN">Senegal</option>
						<option value="RS">Serbia</option>
						<option value="SC">Seychelles</option>
						<option value="SL">Sierra Leone</option>
						<option value="SG">Singapore</option>
						<option value="SX">Sint Maarten (Dutch part)</option>
						<option value="SK">Slovakia</option>
						<option value="SI">Slovenia</option>
						<option value="SB">Solomon Islands</option>
						<option value="SO">Somalia</option>
						<option value="ZA">South Africa</option>
						<option value="GS">South Georgia and the South Sandwich
							Islands</option>
						<option value="SS">South Sudan</option>
						<option value="ES">Spain</option>
						<option value="LK">Sri Lanka</option>
						<option value="SD">Sudan</option>
						<option value="SR">Suriname</option>
						<option value="SJ">Svalbard and Jan Mayen</option>
						<option value="SZ">Swaziland</option>
						<option value="SE">Sweden</option>
						<option value="CH">Switzerland</option>
						<option value="SY">Syrian Arab Republic</option>
						<option value="TW">Taiwan, Province of China</option>
						<option value="TJ">Tajikistan</option>
						<option value="TZ">Tanzania, United Republic of</option>
						<option value="TH">Thailand</option>
						<option value="TL">Timor-Leste</option>
						<option value="TG">Togo</option>
						<option value="TK">Tokelau</option>
						<option value="TO">Tonga</option>
						<option value="TT">Trinidad and Tobago</option>
						<option value="TN">Tunisia</option>
						<option value="TR">Turkey</option>
						<option value="TM">Turkmenistan</option>
						<option value="TC">Turks and Caicos Islands</option>
						<option value="TV">Tuvalu</option>
						<option value="UG">Uganda</option>
						<option value="UA">Ukraine</option>
						<option value="AE">United Arab Emirates</option>
						<option value="UM">United States Minor Outlying Islands</option>
						<option value="UY">Uruguay</option>
						<option value="UZ">Uzbekistan</option>
						<option value="VU">Vanuatu</option>
						<option value="VE">Venezuela, Bolivarian Republic of</option>
						<option value="VG">Virgin Islands, British</option>
						<option value="VI">Virgin Islands, U.S.</option>
						<option value="WF">Wallis and Futuna</option>
						<option value="EH">Western Sahara</option>
						<option value="YE">Yemen</option>
						<option value="ZM">Zambia</option>
						<option value="ZW">Zimbabwe</option> -->
					</select>
				</div>
				<label class="col-sm-2 note"></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="tinh-thanh">Province/City
				</label>
				<div class="col-sm-6">
					<select class="form-control" id="tinh-thanh">
						<option value="">Chọn Tỉnh/Thành phố</option>
						<option value="294">Hồ Chí Minh</option>
						<option value="297">Hà Nội</option>
						<option value="291">Đà Nẵng</option>
						<option value="278">An Giang</option>
						<option value="280">Bà Rịa - Vũng Tàu</option>
						<option value="282">Bắc Giang</option>
						<option value="281">Bắc Kạn</option>
						<option value="279">Bạc Liêu</option>
						<option value="283">Bắc Ninh</option>
						<option value="284">Bến Tre</option>
						<option value="285">Bình Dương</option>
						<option value="286">Bình Phước</option>
						<option value="287">Bình Thuận</option>
						<option value="316">Bình Định</option>
						<option value="289">Cà Mau</option>
						<option value="290">Cần Thơ</option>
						<option value="288">Cao Bằng</option>
						<option value="293">Gia Lai</option>
						<option value="295">Hà Giang</option>
						<option value="296">Hà Nam</option>
						<option value="299">Hà Tĩnh</option>
						<option value="300">Hải Dương</option>
						<option value="301">Hải Phòng</option>
						<option value="319">Hậu Giang</option>
						<option value="302">Hoà Bình</option>
						<option value="320">Hưng Yên</option>
						<option value="321">Khánh Hòa</option>
						<option value="322">Kiên Giang</option>
						<option value="323">Kon Tum</option>
						<option value="304">Lai Châu</option>
						<option value="306">Lâm Đồng</option>
						<option value="305">Lạng Sơn</option>
						<option value="324">Lào Cai</option>
						<option value="325">Long An</option>
						<option value="326">Nam Định</option>
						<option value="327">Nghệ An</option>
						<option value="307">Ninh Bình</option>
						<option value="328">Ninh Thuận</option>
						<option value="329">Phú Thọ</option>
						<option value="308">Phú Yên</option>
						<option value="309">Quảng Bình</option>
						<option value="310">Quảng Nam</option>
						<option value="311">Quảng Ngãi</option>
						<option value="330">Quảng Ninh</option>
						<option value="312">Quảng Trị</option>
						<option value="313">Sóc Trăng</option>
						<option value="331">Sơn La</option>
						<option value="332">Tây Ninh</option>
						<option value="333">Thái Bình</option>
						<option value="334">Thái Nguyên</option>
						<option value="335">Thanh Hóa</option>
						<option value="303">Thừa Thiên Huế</option>
						<option value="336">Tiền Giang</option>
						<option value="314">Trà Vinh</option>
						<option value="315">Tuyên Quang</option>
						<option value="337">Vĩnh Long</option>
						<option value="338">Vĩnh Phúc</option>
						<option value="339">Yên Bái</option>
						<option value="292">Đắk Lắk</option>
						<option value="340">Đắk Nông</option>
						<option value="341">Điện Biên</option>
						<option value="317">Đồng Nai</option>
						<option value="318">Đồng Tháp</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="province-district">District</label>
				<div class="col-sm-6">
					<select class="form-control" id="district">
						<%
							String[] quanArr = {"Quận/huyện", "Quận 1", "Quận 2", "Quận 3", "Quận 4", "Quận 5", "Quận 6", "Quận 7",
									"Quận 8", "Quận 9", "Quận 10", "Quận 11", "Quận 12", "Quận Bình Tân", "Quận Bình Thạnh",
									"Quận Gò Vấp", "Quận Phú Nhuận", "Quận Tân Bình", "Quận Tân Phú", "Quận Thủ Đức",
									"Huyện Bình Chánh", "Huyện Cần Giờ", "Huyện Củ Chi", "Huyện Hóc Môn", "Huyện Nhà Bè"};

							for (String s : quanArr) {
								out.print("<option value=\"" + s + "\">" + s + "</option>");
							}
						%>
					</select>
				</div>
				<label class="col-sm-2" for="adress"></label>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="address">Address
				</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="5" id="address"></textarea>
				</div>
				<label class="col-sm-4 note"></label>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-2">
					<button type="submit" class="btn btn-primary">Register</button>
				</div>
				<div class="col-sm-offset-0 col-sm-4">
					<button type="reset" class="btn btn-default">Remove Form</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$('#configPicker').datepick({
			showTrigger : '#calImg'
		});
	</script>
	<script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>

</body>

</html>