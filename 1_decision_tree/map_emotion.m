function[targets] = map_emotion(targets, emotion)

targets(targets ~= emotion) = 0;
targets(targets == emotion) = 1;

end