% // Limpando variavies e tela de comandos
clc;
clear all; 

% // Fun��o que transforma imagem em sepia
function out = filtro_sepia(image)
  imageDouble = double(image); % // Transformando imagem em tipo double 

  inputRed = imageDouble(:,:,1); %// Extraindo cor Vermelha da imagem 
  inputGreen = imageDouble(:,:,2); %// Extraindo cor Verde da imagem 
  inputBlue = imageDouble(:,:,3); %// Extraindo cor Azul da imagem 

  %// Criando tons de sepia para cada camada RGB
  outputRed = (inputRed * .393) + (inputGreen *.769) + (inputBlue * .189);
  outputGreen = (inputRed * .349) + (inputGreen *.686) + (inputBlue * .168);
  outputBlue = (inputRed * .272) + (inputGreen *.534) + (inputBlue * .131);

  %// Criando imagem com tonalidade s�pia juntando tons criados e convertendo de volta para uint8
  out = uint8(cat(3, outputRed, outputGreen, outputBlue));
endfunction

image = imread('fall-guys.png'); % // Leitura da imagem 
outputImage = filtro_sepia(image); % // Chamada da funcao filtro_sepia passando a imagem 

figure;
imshow(outputImage); %// Mostra imagem sepia

figure;
imshow(image); %// Mostra imagem original
