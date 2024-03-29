package ru.se.ifmo.tinder.model;

import jakarta.persistence.*;
import lombok.*;
import ru.se.ifmo.tinder.model.enums.Status;

@Entity
@Table(name = "user_spacesuit_data")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserSpacesuitData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_spacesuit_data_id")
    private Integer id;
    private Integer head;
    private Integer chest;
    private Integer waist;
    private Integer hips;
    private Integer foot_size;
    private Integer height;
    @Enumerated(EnumType.STRING)
    private Status status;
    @ManyToOne
    @JoinColumn(name="fabric_texture_id")
    private FabricTexture fabricTextureId;
}
