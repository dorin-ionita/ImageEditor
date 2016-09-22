function x=demo()
	bird=imread('flapping_bird.png');
	duck=imread('flapping_duck.png');
	zoom_out=[0.4 0; 0 0.4];
	zoom_in=[1.5 0; 0 1.5];
	rot45=[cos(pi/4) -sin(pi/4);sin(pi/4) cos(pi/4)];
	rot180=[-1 0; 0 -1];
	k=9.8;

	bird_out_forward=forward_mapping(bird,zoom_out);
	bird_rot45_forward=forward_mapping(bird,rot45);
	bird_rot180_forward=forward_mapping(bird,rot180);
	bird_out_inverse=inverse_mapping(bird,zoom_out);
	duck_out_forward=forward_mapping(duck,zoom_out);
	duck_rot_45_forward=forward_mapping(duck,rot45);
	duck_rot_90_forward=forward_mapping(duck,rot180);
	duck_out_inverse=inverse_mapping(duck,zoom_out);
	duck_blur=transform_image(duck,k);
	bird_blur=transform_image(bird,k);
	bird_rot45_inverse=inverse_mapping(bird,rot45);
	bird_rot180_inverse=inverse_mapping(bird,rot180);
	duck_rot45_inverse=inverse_mapping(duck,rot45);
	duck_rot180_inverse=inverse_mapping(duck,rot180);

	imwrite(mat2gray(bird_out_forward),'bird_out_forward.png');
    imwrite(mat2gray(bird_rot45_forward),'bird_rot45_forward.png');
    imwrite(mat2gray(bird_rot180_forward),'bird_rot180_forward.png');
    imwrite(mat2gray(bird_out_inverse),'bird_out_inverse.png');
    imwrite(mat2gray(duck_out_forward),'duck_out_forward.png');
    imwrite(mat2gray(duck_rot_45_forward),'duck_rot_45_forward.png');
    imwrite(mat2gray(duck_rot_90_forward),'duck_rot_180_forward.png');
    imwrite(mat2gray(duck_out_inverse),'duck_out_inverse.png');
    imwrite(mat2gray(duck_blur),'duck_blur.png');
    imwrite(mat2gray(bird_blur),'bird_blur.png');
    imwrite(mat2gray(bird_rot45_inverse),'bird_rot45_inverse.png');
    imwrite(mat2gray(bird_rot180_inverse),'bird_rot180_inverse.png');
    imwrite(mat2gray(duck_rot180_inverse),'duck_rot180_inverse.png');
    imwrite(mat2gray(duck_rot45_inverse),'duck_rot45_inverse.png');

end
