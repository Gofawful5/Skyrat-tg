<<<<<<< HEAD:tgui/packages/tgui/interfaces/EightBallVote.js
import { useBackend } from '../backend';
import { Box, Button, Grid, Section, NoticeBox } from '../components';
import { toTitleCase } from 'common/string';
import { Window } from '../layouts';

export const EightBallVote = (props, context) => {
  const { act, data } = useBackend(context);
=======
import { BooleanLike } from 'common/react';
import { toTitleCase } from 'common/string';

import { useBackend } from '../backend';
import { Box, Button, Grid, NoticeBox, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  shaking: BooleanLike;
  question: string;
  answers: Answer[];
};

type Answer = {
  answer: string;
  amount: number;
  selected: BooleanLike;
};

export const EightBallVote = (props) => {
  const { act, data } = useBackend<Data>();
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/EightBallVote.tsx
  const { shaking } = data;
  return (
    <Window width={400} height={600}>
      <Window.Content>
        {(!shaking && (
          <NoticeBox>No question is currently being asked.</NoticeBox>
        )) || <EightBallVoteQuestion />}
      </Window.Content>
    </Window>
  );
};

<<<<<<< HEAD:tgui/packages/tgui/interfaces/EightBallVote.js
const EightBallVoteQuestion = (props, context) => {
  const { act, data } = useBackend(context);
=======
const EightBallVoteQuestion = (props) => {
  const { act, data } = useBackend<Data>();
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2:tgui/packages/tgui/interfaces/EightBallVote.tsx
  const { question, answers = [] } = data;
  return (
    <Section>
      <Box bold textAlign="center" fontSize="16px" m={1}>
        &quot;{question}&quot;
      </Box>
      <Grid>
        {answers.map((answer) => (
          <Grid.Column key={answer.answer}>
            <Button
              fluid
              bold
              content={toTitleCase(answer.answer)}
              selected={answer.selected}
              fontSize="16px"
              lineHeight="24px"
              textAlign="center"
              mb={1}
              onClick={() =>
                act('vote', {
                  answer: answer.answer,
                })
              }
            />
            <Box bold textAlign="center" fontSize="30px">
              {answer.amount}
            </Box>
          </Grid.Column>
        ))}
      </Grid>
    </Section>
  );
};
