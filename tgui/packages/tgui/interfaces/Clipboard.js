<<<<<<< HEAD:tgui/packages/tgui/interfaces/Clipboard.js
=======
import { BooleanLike } from 'common/react';

>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/Clipboard.tsx
import { useBackend } from '../backend';
import {
  Box,
  Button,
  Divider,
  Flex,
  LabeledList,
  Section,
} from '../components';
import { Window } from '../layouts';

<<<<<<< HEAD:tgui/packages/tgui/interfaces/Clipboard.js
export const Clipboard = (props, context) => {
  const { act, data } = useBackend(context);
=======
type Data = {
  pen: string;
  integrated_pen: BooleanLike;
  top_paper: string;
  top_paper_ref: string;
  paper: string[];
  paper_ref: string[];
};

export const Clipboard = (props) => {
  const { act, data } = useBackend<Data>();
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/Clipboard.tsx
  const { pen, integrated_pen, top_paper, top_paper_ref, paper, paper_ref } =
    data;
  return (
    <Window title="Clipboard" width={400} height={500}>
      <Window.Content backgroundColor="#704D25" scrollable>
        <Section>
          {pen ? (
            <LabeledList>
              <LabeledList.Item
                label="Pen"
                buttons={
                  <Button icon="eject" onClick={() => act('remove_pen')} />
                }
              >
                {pen}
              </LabeledList.Item>
            </LabeledList>
          ) : integrated_pen ? (
            <Box color="white" align="center">
              There is a pen integrated into the clipboard&apos;s clip.
            </Box>
          ) : (
            <Box color="white" align="center">
              No pen attached!
            </Box>
          )}
        </Section>
        <Divider />
        {top_paper ? (
          <Flex
            color="black"
            backgroundColor="white"
            style={{ padding: '2px 2px 0 2px' }}
          >
            <Flex.Item align="center" grow={1}>
              <Box align="center">{top_paper}</Box>
            </Flex.Item>
            <Flex.Item>
              <Button
                icon={pen ? 'pen' : 'eye'}
                onClick={() => act('edit_paper', { ref: top_paper_ref })}
              />
              <Button
                icon="tag"
                onClick={() => act('rename_paper', { ref: top_paper_ref })}
              />
              <Button
                icon="eject"
                onClick={() => act('remove_paper', { ref: top_paper_ref })}
              />
            </Flex.Item>
          </Flex>
        ) : (
          <Section>
            <Box color="white" align="center">
              The clipboard is empty!
            </Box>
          </Section>
        )}
        {paper.length > 0 && <Divider />}
        {paper.map((paper_item, index) => (
          <Flex
            key={paper_ref[index]}
            color="black"
            backgroundColor="white"
            style={{ padding: '2px 2px 0 2px' }}
            mb={0.5}
          >
            <Flex.Item>
              <Button
                icon="chevron-up"
                color="transparent"
                iconColor="black"
                onClick={() => act('move_top_paper', { ref: paper_ref[index] })}
              />
            </Flex.Item>
            <Flex.Item align="center" grow={1}>
              <Box align="center">{paper_item}</Box>
            </Flex.Item>
            <Flex.Item>
              <Button
                icon={pen ? 'pen' : 'eye'}
                onClick={() => act('edit_paper', { ref: paper_ref[index] })}
              />
              <Button
                icon="tag"
                onClick={() => act('rename_paper', { ref: paper_ref[index] })}
              />
              <Button
                icon="eject"
                onClick={() => act('remove_paper', { ref: paper_ref[index] })}
              />
            </Flex.Item>
          </Flex>
        ))}
      </Window.Content>
    </Window>
  );
};
