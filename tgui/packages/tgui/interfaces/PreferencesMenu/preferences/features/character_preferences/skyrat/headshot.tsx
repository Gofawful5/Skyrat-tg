// THIS IS A SKYRAT UI FILE
import { Feature, FeatureShortTextInput } from '../../base';

export const headshot: Feature<string> = {
  name: 'Headshot',
  description:
    'Add an image to your character, visible on close examination. Requires it be formatted properly.',
  component: FeatureShortTextInput,
};
