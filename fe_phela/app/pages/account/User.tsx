import { useParams } from 'react-router-dom';

function User() {
  const { id } = useParams();
  return <div>ID người dùng: {id}</div>;
}