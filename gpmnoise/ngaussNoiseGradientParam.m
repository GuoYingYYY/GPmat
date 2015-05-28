function g = ngaussNoiseGradientParam(noise, mu, varsigma, y)


% NGAUSSNOISEGRADIENTPARAM Gradient of NGAUSS noise's parameters.
% FORMAT
% DESC computes the gradient of the log Z of the noiseless Gaussian noise model with respect to the of functions with respect to the
% noiseless Gaussian
% noise's parameters. 
% ARG noise : the noise structure for which the gradients are being
% computed.
% ARG mu : the input means for which the gradients are being computed.
% ARG varSigma : the input variances for which the gradients are being computed.
% ARG y : the target values for the noise model.
% RETURN g : gradients of the log Z with respect to
% the noise parameters. The ordering of the vector should match
% that provided by the function noiseExtractParam.
%
%
% SEEALSO ngaussNoiseParamInit, ngaussnoiseGradVals, noiseGradientParam
%
% COPYRIGHT : Neil D. Lawrence, 2004, 2005

% NOISE


D = size(y, 2);
u = zeros(size(y));

for i = 1:D
  mu(:, i) = mu(:, i) + noise.bias(i);
end

u = y - mu;
nu = 1./(varsigma+noise.sigma2);
u = u.*nu;
gbias = sum(u, 1);
g = [gbias];
