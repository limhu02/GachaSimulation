package gacha.secu.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration //환경을 설정하는 어노테이션
@EnableWebSecurity
public class SecurityConfigration { //시큐리티 구성요소 클래스
	@Autowired
	DataSource dataSource; //데이터 베이스 접근용 객체

	@SuppressWarnings({ "removal", "removal" })
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		//통과시킬 요청, 막을 요청을 선택한다.
	
		http.csrf().disable().authorizeHttpRequests().requestMatchers("/gameImage/**","/boxImage/**","/userprofile/**","/upload/**",
				"/itemImage/**","/css/**","/WEB-INF/**").permitAll()
		.requestMatchers("/").permitAll()
		.requestMatchers("/index**").permitAll()
		.requestMatchers("/login/**").permitAll()
		//csrf 파일(Cross Site Request Forgery)를 비활성화 -> 사용자의 의도없이 특정 사이트를 공격하는 행위를 비활성화
		.requestMatchers("/index/index.html").permitAll()
		.requestMatchers("/board/detail*").permitAll()
		.requestMatchers("/board/mypage.html").hasAnyRole("MEMBER","ADMIN") //마이페이지 접근
		.requestMatchers("/board/write.html").hasAnyRole("MEMBER","ADMIN")
		.requestMatchers("/board/**").permitAll()
		.requestMatchers("/entry/**").permitAll()
		.requestMatchers("/gacha/**").permitAll()
		.requestMatchers("/item/inputItembox.html").hasRole("ADMIN")
		.requestMatchers("/item/BoxinputResult.html").hasRole("ADMIN")
		.requestMatchers("/item/inputResult.html").hasRole("ADMIN")
		.requestMatchers("/item/input.html").hasRole("ADMIN")
		.requestMatchers("/item/itemBoxManage.html").hasRole("ADMIN")
		.requestMatchers("/item/input.html").hasRole("ADMIN")
		.requestMatchers("/item/input.html").hasRole("ADMIN")
		.requestMatchers("/item/input.html").hasRole("ADMIN")
		.requestMatchers("/item/**").permitAll()
		.requestMatchers("/admin/**").hasRole("ADMIN") // 해당 페이지는 관리자 권한 만 허용. hasRole에 들어가는 권한은 관리자가 부여한 권한을 입력
		.requestMatchers("/comment/**").hasAnyRole("MEMBER","ADMIN")
		.requestMatchers("/board/detail.html").permitAll()
		.requestMatchers("/comment/modifyComment.html").permitAll()
		.anyRequest().authenticated() //나머지 요청은 모두 보안 검사를 진행한다는 의미
		; 
		//imgs 와 css 아래의 모든 요청을 허용한다는 의미. *는 해당 경로 바로 밑에있는것만 가능, **는 해당 경로 밑에 있는 모든 것이 가능
		//계속 해당 경로 하에 있는 것들 허용
		//http.formLogin();//보안 검사에 스프링이 자체적으로 가진 로그인 창 사용하도록 설정
		//permitAll 한 것을 제외한 나머지는 이제 못봄
		http.formLogin().loginPage("/login/loginsec.html")//개발자가 만든 로그인창 사용,해당 주소로 이동시 로그인창으로 이동하는 맵핑 함수 정의 필요
		.usernameParameter("user_id").passwordParameter("user_pwd")
		//로그인 창의 id, password값을 가져와서 해당 정보를 받아 로그인 진행
		.loginProcessingUrl("/login/login.html")
		//로그인 버튼 입력 이후 접속할 페이지 주소 설정
		.defaultSuccessUrl("/index/index.html",true).permitAll();
		// 로그인 성공시 접속할 페이지 설정, 이것들은 그냥 사용자 모두 접속 가능(로그인 실패대비)
		  // X-Frame-Options 설정 추가
        http.headers().frameOptions().sameOrigin(); // 이 설정은 같은 출처의 iframe만 허용

		
		return http.build();//리턴
	}
	
	//로그인하기 (계정, 암호 처리)
	//1. 계정 과 암호를 메모리에서 불러오기
	//2. 스프링 시큐리티의 기본 db 테이블에서 불ㄹ오기
	//3. 개발자가 만든 db 테이블에서 불러오기
	
	//1번 방법
	@Primary
	@Bean
	public AuthenticationManagerBuilder configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		String admin = passwordEncoder().encode("admin");
		String test0123 = passwordEncoder().encode("0123");
		System.out.println(admin);
		System.out.println(test0123);
	
		
		//계정,암호,활성화를 검색하는 쿼리
				String queryForId = "select user_id,user_pwd,enabled from user_info where user_id = ?";
				//계정,권한을 검색한 쿼리
				String queryForAuth = "select m.user_id, a.auth from user_info m, user_auth a "
						+ "where m.user_id = a.user_id and a.user_id = ?";
				
		auth.jdbcAuthentication().dataSource(dataSource)
		.passwordEncoder(passwordEncoder())
		.usersByUsernameQuery(queryForId)
		.authoritiesByUsernameQuery(queryForAuth);//auth는 데이터베이스에 접근해서 값을 가져오도록 한다.
		//.passwordEncoder(passwordEncoder()); //암호화 함수 설정 
		
		return auth;
		
	}
	@Bean 
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	

}
