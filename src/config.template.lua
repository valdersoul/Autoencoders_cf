dofile("SDAECriterionGPU.lua")

configV = 
{
   layer1 = 
   {      
      isTied    = false,
      coefLayer = 10,
      { 
         criterion = nnsparse.SDAECriterionGPU(nn.MSECriterion(),
         {
            alpha = 1,
            beta  = 0.8,
            hideRatio = 0.20,
         }), 
         --criterion = nn.MSECriterion(),
         noEpoch = 1, 
         miniBatchSize = 20,
         learningRate = 0.03,  
         learningRateDecay = 0.1,
         weightDecay = 0.03,
      },
      
   },
   
   layer2 = 
   {
      isTied    = false,
      plot      = false,
      coefLayer = 12,
      { 
         criterion = nnsparse.SDAECriterionGPU(nn.MSECriterion(),
         {
            alpha = 1,
            beta  = 0.8,
            noiseRatio = 0.2,
            noiseStd  = 0.02, 
         }),
         noEpoch = 40, 
         miniBatchSize = 5,
         learningRate  = 1e-4,  
         learningRateDecay = 0.1,
         weightDecay = 0.2,
         momentum = 0.8
      },
      
      {
         criterion = nnsparse.SDAECriterionGPU(nn.MSECriterion(),
         {
            alpha = 1.2,
            beta  = 0.8,
            noiseRatio = 0,
            hideRatio = 0.20,
         }),
         noEpoch = 15,
         miniBatchSize = 20,
         learningRate  = 0.003,
         learningRateDecay = 0.2,
         weightDecay = 0.03,
         
      },
      
   },
   
   layer3 = nil

}
