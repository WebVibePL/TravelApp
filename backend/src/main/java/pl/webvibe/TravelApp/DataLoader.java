package pl.webvibe.TravelApp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import pl.webvibe.TravelApp.domain.user.boundary.AppUserRepository;
import pl.webvibe.TravelApp.domain.user.entity.AppUser;

@Component
public class DataLoader implements ApplicationRunner {

    @Autowired
    private AppUserRepository applicationUserRepository;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        AppUser appUser = new AppUser();
        appUser.setUsername("dawid");
        appUser.setPassword("dawid");
        appUser.setPassword(new BCryptPasswordEncoder().encode(appUser.getPassword()));
        System.out.println("App user loaded: " + appUser.toString());
        applicationUserRepository.save(appUser);
    }
}
