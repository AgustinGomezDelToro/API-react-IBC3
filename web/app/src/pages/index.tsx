
import { useEffect, useState } from "react";

const Index = () => {
    const [zoo, setZoo] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchZoo();
    }, []);

    const fetchZoo = async () => {
        // route pour récupérer les données de l'API
        const res = await fetch("/api/zoo");
        const data = await res.json();
        setZoo(data);
        setLoading(false);
    };

    return (
        <div>
            {loading ? (
                "Loading..."
            ) : (
                <div>
                    <h1>{zoo.name}</h1>
                    <p>{zoo.description}</p>

                </div>
            )}
        </div>
    );
};

export default Index;