package pl.webvibe.TravelApp.domain.security.control;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.webvibe.TravelApp.domain.user.boundary.AppUserRepository;
import pl.webvibe.TravelApp.domain.user.entity.AppUser;

import java.util.Optional;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private AppUserRepository applicationUserRepository;

    public UserDetailsServiceImpl(AppUserRepository applicationUserRepository) {
        this.applicationUserRepository = applicationUserRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AppUser applicationUser = Optional.ofNullable(applicationUserRepository.findByUsername(username))
                .orElseThrow(() -> new UsernameNotFoundException(username));

        return User
                .withUsername(applicationUser.getUsername())
                .password(applicationUser.getPassword())
                .roles("ADMIN")
                .build();
    }
}
