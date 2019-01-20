package pl.webvibe.TravelApp.domain.user.boundary;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.webvibe.TravelApp.domain.user.entity.AppUser;

public interface AppUserRepository extends JpaRepository<AppUser, Long> {
    AppUser findByUsername(String username);
}
