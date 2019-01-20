package pl.webvibe.TravelApp.domain.user.boundary;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import pl.webvibe.TravelApp.domain.user.entity.AppUser;

@RestController
@RequestMapping("/users")
public class AppUserController {

    private AppUserRepository applicationUserRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public AppUserController(AppUserRepository applicationUserRepository,
                          BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.applicationUserRepository = applicationUserRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

//    @PreAuthorize("hasAuthority('REGISTRATION')")
    @PostMapping()
    public void signUp(@RequestBody AppUser user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        applicationUserRepository.save(user);
    }

    @GetMapping()
    public String getall(){
        return "aaa";
    }
}
