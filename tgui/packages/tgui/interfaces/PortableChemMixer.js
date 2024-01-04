import { sortBy } from 'common/collections';
<<<<<<< HEAD:tgui/packages/tgui/interfaces/PortableChemMixer.js
import { toTitleCase } from 'common/string';
=======

>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/PortableChemMixer.tsx
import { useBackend } from '../backend';
import { Box, Button, Section } from '../components';
import { Window } from '../layouts';
import { Beaker, BeakerDisplay } from './common/BeakerDisplay';

<<<<<<< HEAD:tgui/packages/tgui/interfaces/PortableChemMixer.js
export const PortableChemMixer = (props, context) => {
  const { act, data } = useBackend(context);
  const recording = !!data.recordingRecipe;
  const beakerTransferAmounts = data.beakerTransferAmounts || [];
  const beakerContents =
    (recording &&
      Object.keys(data.recordingRecipe).map((id) => ({
        id,
        name: toTitleCase(id.replace(/_/, ' ')),
        volume: data.recordingRecipe[id],
      }))) ||
    data.beakerContents ||
    [];
  const chemicals = sortBy((chem) => chem.title)(data.chemicals);
=======
type DispensableReagent = {
  title: string;
  id: string;
  volume: number;
  pH: number;
};

type Data = {
  amount: number;
  chemicals: DispensableReagent[];
  beaker: Beaker;
};

export const PortableChemMixer = (props) => {
  const { act, data } = useBackend<Data>();
  const { beaker } = data;
  const beakerTransferAmounts = beaker ? beaker.transferAmounts : [];
  const chemicals = sortBy((chem: DispensableReagent) => chem.id)(
    data.chemicals,
  );
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/PortableChemMixer.tsx
  return (
    <Window width={465} height={550}>
      <Window.Content scrollable>
        <Section
          title="Dispense"
          buttons={beakerTransferAmounts.map((amount) => (
            <Button
              key={amount}
              icon="plus"
              selected={amount === data.amount}
              content={amount}
              onClick={() =>
                act('amount', {
                  target: amount,
                })
              }
            />
          ))}
        >
          <Box>
            {chemicals.map((chemical) => (
              <Button
                key={chemical.id}
                icon="tint"
                fluid
                lineHeight={1.75}
                content={`(${chemical.volume}) ${chemical.title}`}
                tooltip={'pH: ' + chemical.pH}
                onClick={() =>
                  act('dispense', {
                    reagent: chemical.id,
                  })
                }
              />
            ))}
          </Box>
        </Section>
        <Section
          title="Disposal controls"
          buttons={beakerTransferAmounts.map((amount) => (
            <Button
              key={amount}
              icon="minus"
              disabled={recording}
              content={amount}
              onClick={() => act('remove', { amount })}
            />
<<<<<<< HEAD:tgui/packages/tgui/interfaces/PortableChemMixer.js
          ))}>
          <LabeledList>
            <LabeledList.Item
              label="Beaker"
              buttons={
                !!data.isBeakerLoaded && (
                  <Button
                    icon="eject"
                    content="Eject"
                    disabled={!data.isBeakerLoaded}
                    onClick={() => act('eject')}
                  />
                )
              }>
              {(recording && 'Virtual beaker') ||
                (data.isBeakerLoaded && (
                  <>
                    <AnimatedNumber
                      initial={0}
                      value={data.beakerCurrentVolume}
                    />
                    /{data.beakerMaxVolume} units
                  </>
                )) ||
                'No beaker'}
            </LabeledList.Item>
            <LabeledList.Item label="Contents">
              <Box color="label">
                {(!data.isBeakerLoaded && !recording && 'N/A') ||
                  (beakerContents.length === 0 && 'Nothing')}
              </Box>
              {beakerContents.map((chemical) => (
                <Box key={chemical.name} color="label">
                  <AnimatedNumber initial={0} value={chemical.volume} /> units
                  of {chemical.name}
                </Box>
              ))}
              {beakerContents.length > 0 && !!data.showpH && (
                <Box>
                  pH:
                  <AnimatedNumber value={data.beakerCurrentpH} />
                </Box>
              )}
            </LabeledList.Item>
          </LabeledList>
=======
          ))}
        >
          <BeakerDisplay beaker={beaker} showpH />
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/PortableChemMixer.tsx
        </Section>
      </Window.Content>
    </Window>
  );
};
